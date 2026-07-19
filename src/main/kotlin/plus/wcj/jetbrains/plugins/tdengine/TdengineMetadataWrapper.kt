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
import com.intellij.database.dialects.base.introspector.jdbc.wrappers.ClosableIt
import com.intellij.database.dialects.base.introspector.jdbc.wrappers.DatabaseMetaDataWrapper
import com.intellij.database.dialects.generic.introspector.jdbc.GenericMetadataWrapper
import com.intellij.database.remote.jdbc.RemoteDatabaseMetaData
import com.intellij.database.remote.jdbc.RemoteResultSet
import com.intellij.database.remote.jdbc.helpers.JdbcNativeUtil
import com.intellij.openapi.util.text.StringUtil

class TdengineMetadataWrapper(
    connection: DatabaseConnectionCore,
    data: RemoteDatabaseMetaData
) : GenericMetadataWrapper(connection, data) {

    private val databaseProductVersion = runCatching { data.databaseProductVersion }.getOrNull()

    override fun tablesInner(
        schema: DatabaseMetaDataWrapper.Schema,
        tableNamePattern: String?,
        types: Array<String>?
    ): ClosableIt<out DatabaseMetaDataWrapper.Table> {
        if (!includesTables(types)) {
            return super.tablesInner(schema, tableNamePattern, types)
        }

        return try {
            val tableNames = loadTables(schema, tableNamePattern)
            ClosableIt.from(tableNames.map { tableName ->
                DatabaseMetaDataWrapper.Table(schema, tableName).apply {
                    type = TABLE_TYPE
                }
            }.iterator())
        } catch (t: Throwable) {
            onError("Failed to load TDengine tables.", t)
            ClosableIt.empty()
        }
    }

    private fun loadTables(
        schema: DatabaseMetaDataWrapper.Schema,
        tableNamePattern: String?
    ): List<String> {
        val databaseName = schema.database?.takeUnless { StringUtil.isEmptyOrSpaces(it) }
            ?: schema.schema?.takeUnless { StringUtil.isEmptyOrSpaces(it) }
            ?: return emptyList()

        val statement = JdbcNativeUtil.computeRemote { connectionCore.remoteConnection.createStatement() }
            ?: return emptyList()

        return try {
            val tableNames = LinkedHashSet<String>()
            for (query in TdengineMetadataQueries.build(databaseProductVersion, databaseName, tableNamePattern)) {
                tableNames += readTableNames(
                    JdbcNativeUtil.computeRemote {
                        statement.executeQuery(query)
                    } ?: return emptyList()
                )
            }
            tableNames.toList()
        } finally {
            JdbcNativeUtil.closeRemoteStatementSafe(statement)
        }
    }

    private fun readTableNames(resultSet: RemoteResultSet): List<String> {
        return try {
            buildList {
                while (JdbcNativeUtil.computeRemote { resultSet.next() } == true) {
                    val tableName = JdbcNativeUtil.computeRemote { resultSet.getString(1) }?.trim()
                    if (!tableName.isNullOrEmpty()) {
                        add(tableName)
                    }
                }
            }
        } finally {
            JdbcNativeUtil.performSafe { resultSet.close() }
        }
    }

    private fun includesTables(types: Array<String>?): Boolean {
        return types == null || types.any { it.equals(TABLE_TYPE, ignoreCase = true) }
    }

    private val connectionCore: DatabaseConnectionCore
        get() = getConnection()

    companion object {
        private const val TABLE_TYPE = "TABLE"
    }
}

internal object TdengineMetadataQueries {

    fun build(productVersion: String?, databaseName: String, tableNamePattern: String?): List<String> = buildList {
        add(buildNormalTablesSql(databaseName, tableNamePattern))
        if (supportsVirtualTables(productVersion)) {
            add(buildVirtualTablesSql(databaseName, tableNamePattern))
        }
        add(buildStablesSql(databaseName, tableNamePattern))
    }

    private fun supportsVirtualTables(productVersion: String?): Boolean {
        val version = TdengineVersion.parse(productVersion) ?: return false
        return version >= MIN_VIRTUAL_TABLE_VERSION
    }

    private fun buildNormalTablesSql(databaseName: String, tableNamePattern: String?): String {
        return buildString {
            append("SHOW NORMAL ")
            append(StringUtils.escapeIdentifier(databaseName))
            append(".TABLES")
            appendLikeClause(tableNamePattern)
        }
    }

    private fun buildStablesSql(databaseName: String, tableNamePattern: String?): String {
        return buildString {
            append("SHOW ")
            append(StringUtils.escapeIdentifier(databaseName))
            append(".STABLES")
            appendLikeClause(tableNamePattern)
        }
    }

    private fun buildVirtualTablesSql(databaseName: String, tableNamePattern: String?): String {
        return buildString {
            append("SHOW NORMAL ")
            append(StringUtils.escapeIdentifier(databaseName))
            append(".VTABLES")
            appendLikeClause(tableNamePattern)
        }
    }

    private fun StringBuilder.appendLikeClause(tableNamePattern: String?) {
        val normalizedPattern = tableNamePattern?.takeUnless { StringUtil.isEmptyOrSpaces(it) } ?: return
        append(" LIKE '")
        append(StringUtils.escapeSqlLiteral(normalizedPattern))
        append("'")
    }

    private data class TdengineVersion(
        val major: Int,
        val minor: Int,
        val patch: Int,
        val build: Int
    ) : Comparable<TdengineVersion> {

        override fun compareTo(other: TdengineVersion): Int {
            return compareValuesBy(
                this,
                other,
                TdengineVersion::major,
                TdengineVersion::minor,
                TdengineVersion::patch,
                TdengineVersion::build
            )
        }

        companion object {
            private val VERSION_REGEX = Regex("""\d+(?:\.\d+){1,3}""")

            fun parse(value: String?): TdengineVersion? {
                val versionText = value?.let(VERSION_REGEX::find)?.value ?: return null
                val parts = versionText.split('.').map { it.toIntOrNull() ?: return null }.toMutableList()
                while (parts.size < 4) {
                    parts += 0
                }
                return TdengineVersion(parts[0], parts[1], parts[2], parts[3])
            }
        }
    }

    // Virtual tables were introduced in TDengine 3.3.6.0.
    private val MIN_VIRTUAL_TABLE_VERSION = TdengineVersion(3, 3, 6, 0)
}

class TdengineMetadataWrapperFactory : DatabaseMetaDataWrapper.MDFactory() {
    override fun create(
        connection: DatabaseConnectionCore,
        data: RemoteDatabaseMetaData
    ): DatabaseMetaDataWrapper {
        return TdengineMetadataWrapper(connection, data)
    }
}
