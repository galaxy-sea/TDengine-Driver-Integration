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
            tableNames += readTableNames(
                JdbcNativeUtil.computeRemote {
                    statement.executeQuery(buildNormalTablesSql(databaseName, tableNamePattern))
                } ?: return emptyList()
            )
            tableNames += readTableNames(
                JdbcNativeUtil.computeRemote {
                    statement.executeQuery(buildVirtualTablesSql(databaseName, tableNamePattern))
                } ?: return emptyList()
            )
            tableNames += readTableNames(
                JdbcNativeUtil.computeRemote {
                    statement.executeQuery(buildStablesSql(databaseName, tableNamePattern))
                } ?: return emptyList()
            )
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

    private fun buildNormalTablesSql(databaseName: String, tableNamePattern: String?): String {
        return buildString {
            append("SHOW NORMAL ")
            append(escapeIdentifier(databaseName))
            append(".TABLES")
            appendLikeClause(tableNamePattern)
        }
    }

    private fun buildStablesSql(databaseName: String, tableNamePattern: String?): String {
        return buildString {
            append("SHOW ")
            append(escapeIdentifier(databaseName))
            append(".STABLES")
            appendLikeClause(tableNamePattern)
        }
    }

    private fun buildVirtualTablesSql(databaseName: String, tableNamePattern: String?): String {
        return buildString {
            append("SHOW NORMAL ")
            append(escapeIdentifier(databaseName))
            append(".VTABLES")
            appendLikeClause(tableNamePattern)
        }
    }

    private fun includesTables(types: Array<String>?): Boolean {
        return types == null || types.any { it.equals(TABLE_TYPE, ignoreCase = true) }
    }

    private fun escapeIdentifier(value: String): String {
        return value.replace("`", "``")
    }

    private fun escapeSqlLiteral(value: String): String {
        return value.replace("'", "''")
    }

    private fun StringBuilder.appendLikeClause(tableNamePattern: String?) {
        val normalizedPattern = tableNamePattern?.takeUnless { StringUtil.isEmptyOrSpaces(it) } ?: return
        append(" LIKE '")
        append(escapeSqlLiteral(normalizedPattern))
        append("'")
    }

    private val connectionCore: DatabaseConnectionCore
        get() = getConnection()

    companion object {
        private const val TABLE_TYPE = "TABLE"
    }
}

class TdengineMetadataWrapperFactory : DatabaseMetaDataWrapper.MDFactory() {
    override fun create(
        connection: DatabaseConnectionCore,
        data: RemoteDatabaseMetaData
    ): DatabaseMetaDataWrapper {
        return TdengineMetadataWrapper(connection, data)
    }
}
