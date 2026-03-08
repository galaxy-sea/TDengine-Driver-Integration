/*
 * Copyright 2026-present The original author or authors.
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */

package plus.wcj.jetbrains.plugins.tdengine

import com.intellij.database.dataSource.DatabaseConnectionCore
import com.intellij.database.dialects.AbstractDefinitionProvider
import com.intellij.database.model.DasObject
import com.intellij.database.model.ObjectKind
import com.intellij.database.remote.jdbc.RemoteResultSet
import com.intellij.database.remote.jdbc.RemoteStatement
import com.intellij.database.remote.jdbc.helpers.JdbcNativeUtil
import com.intellij.database.util.DasUtil
import com.intellij.openapi.util.text.StringUtil
import com.intellij.util.PairConsumer

class TdengineDefinitionProvider : AbstractDefinitionProvider() {
    override fun isSupported(`object`: DasObject): Boolean {
        return `object`.kind == ObjectKind.TABLE ||
            `object`.kind == ObjectKind.SCHEMA ||
            `object`.kind == ObjectKind.DATABASE
    }

    override fun fetchSources(
        objects: Iterable<out DasObject>,
        connection: DatabaseConnectionCore,
        consumer: PairConsumer<DasObject, Any>
    ) {
        val statement = JdbcNativeUtil.computeRemote { connection.remoteConnection.createStatement() } ?: return

        try {
            for (obj in objects) {
                try {
                    consumer.consume(obj, loadDefinition(statement, obj) ?: "")
                } catch (t: Throwable) {
                    consumer.consume(obj, t)
                }
            }
        } finally {
            JdbcNativeUtil.closeRemoteStatementSafe(statement)
        }
    }

    private fun buildShowCreateTableSql(obj: DasObject): String {
        val schemaName = DasUtil.getSchema(obj)?.takeUnless { StringUtil.isEmptyOrSpaces(it) }
        val tableName = obj.name

        return buildString {
            append("SHOW CREATE TABLE ")
            if (schemaName != null) {
                append(StringUtils.quoteIdentifier(schemaName))
                append('.')
            }
            append(StringUtils.quoteIdentifier(tableName))
        }
    }

    private fun extractDefinition(resultSet: RemoteResultSet): String? {
        if (!resultSet.next()) {
            return null
        }

        val metadata = resultSet.metaData
        val columnCount = metadata.columnCount
        var secondColumn: String? = null
        var fallback: String? = null

        for (index in 1..columnCount) {
            val value = resultSet.getString(index)?.trim()
            if (value.isNullOrEmpty()) {
                continue
            }

            if (index == 2 && secondColumn == null) {
                secondColumn = value
            }

            val columnName = metadata.getColumnLabel(index).orEmpty()
            if (columnName.contains("create", ignoreCase = true) || value.startsWith("CREATE ", ignoreCase = true)) {
                return value
            }

            if (fallback == null) {
                fallback = value
            }
        }

        return secondColumn ?: fallback
    }

    private fun loadDefinition(statement: RemoteStatement, obj: DasObject): String? {
        val resultSet = JdbcNativeUtil.computeRemote {
            statement.executeQuery(buildShowCreateSql(obj))
        } ?: return null

        return try {
            extractDefinition(resultSet)
        } finally {
            JdbcNativeUtil.performSafe { resultSet.close() }
        }
    }

    private fun buildShowCreateSql(obj: DasObject): String {
        return when (obj.kind) {
            ObjectKind.TABLE -> buildShowCreateTableSql(obj)
            ObjectKind.SCHEMA, ObjectKind.DATABASE -> buildShowCreateDatabaseSql(obj)
            else -> error("Unsupported TDengine object kind: ${obj.kind}")
        }
    }

    private fun buildShowCreateDatabaseSql(obj: DasObject): String {
        return buildString {
            append("SHOW CREATE DATABASE ")
            append(StringUtils.quoteIdentifier(obj.name))
        }
    }
}
