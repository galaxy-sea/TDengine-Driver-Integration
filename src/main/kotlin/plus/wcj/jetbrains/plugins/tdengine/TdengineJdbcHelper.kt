package plus.wcj.jetbrains.plugins.tdengine

import com.intellij.database.remote.jdbc.helpers.GenericJdbcHelperBase
import com.intellij.database.remote.jdbc.helpers.JdbcHelperImpl
import java.sql.Connection
import java.sql.Driver
import java.sql.ResultSet
import java.sql.ResultSetMetaData
import java.sql.SQLFeatureNotSupportedException
import java.sql.Statement
import java.io.Serializable
import java.util.Properties

// 暂时不使用
class TdengineJdbcHelper : GenericJdbcHelperBase {
    constructor() : super(DBMS_NAME, null, null, null)
    private constructor(version: String?, connection: Connection?, jdbcClassLoader: ClassLoader?) :
        super(DBMS_NAME, version, connection, jdbcClassLoader)
    private constructor(source: TdengineJdbcHelper, jdbcClassLoader: ClassLoader) : super(source, jdbcClassLoader)

    override fun create(
        version: String?,
        connection: Connection?,
        jdbcClassLoader: ClassLoader?
    ): JdbcHelperImpl = TdengineJdbcHelper(version, connection, jdbcClassLoader)

    override fun create(
        connection: Connection?,
        dbmsName: String?,
        version: String,
        jdbcClassLoader: ClassLoader?
    ): GenericJdbcHelperBase = TdengineJdbcHelper(version, connection, jdbcClassLoader)

    override fun bindClassLoader(jdbcClassLoader: ClassLoader): JdbcHelperImpl = TdengineJdbcHelper(this, jdbcClassLoader)

    override fun detect(driver: Driver, url: String?): Boolean =
        classNameContains(driver, "taosdata") || url.orEmpty().contains(":TAOS", ignoreCase = true)

    override fun canChangePassword(driver: Driver, url: String?, properties: Properties): Boolean = false

    override fun changeExpiredPassword(
        driver: Driver,
        url: String?,
        properties: Properties,
        extra: MutableMap<String, Serializable>,
        newPassword: String
    ) {
        throw SQLFeatureNotSupportedException("TDengine JDBC driver does not support password change via JetBrains helper")
    }

    override fun detect(
        connection: Connection?,
        productName: String?,
        productVersion: String?,
        helper: JdbcHelperImpl?,
        jdbcClassLoader: ClassLoader?
    ): GenericJdbcHelperBase? {
        if (!isTdengine(productName, connection)) return null
        return TdengineJdbcHelper(resolveVersion(connection, productVersion), connection, jdbcClassLoader)
    }

    override fun computeJdbcCatalogIsSchema(): Boolean = false

    override fun getCatalogName(metaData: ResultSetMetaData, column: Int): String? =
        runCatching { metaData.getCatalogName(column) }.getOrNull()?.takeUnless { it.isBlank() }

    override fun getSchemaName(metaData: ResultSetMetaData, column: Int): String? =
        runCatching { metaData.getSchemaName(column) }.getOrNull()?.takeUnless { it.isBlank() }

    override fun getTableName(metaData: ResultSetMetaData, column: Int): String? =
        runCatching { metaData.getTableName(column) }.getOrNull()?.takeUnless { it.isBlank() }

    override fun getPrecision(metaData: ResultSetMetaData, column: Int): Int =
        runCatching { super.getPrecision(metaData, column) }.getOrDefault(0)

    override fun setFetchSize(statement: Statement, rows: Int) {
        runCatching { super.setFetchSize(statement, rows) }
    }

    override fun setFetchSize(resultSet: ResultSet, rows: Int) {
        runCatching { super.setFetchSize(resultSet, rows) }
    }

    private fun isTdengine(productName: String?, connection: Connection?): Boolean {
        if (productName.equals(PRODUCT_NAME, ignoreCase = true)) return true
        if (runCatching { connection?.metaData?.databaseProductName }.getOrNull().equals(PRODUCT_NAME, ignoreCase = true)) {
            return true
        }
        return runCatching { connection?.metaData?.url }.getOrNull()?.contains(":TAOS", ignoreCase = true) == true
    }

    private fun resolveVersion(connection: Connection?, productVersion: String?): String {
        extractVersion(productVersion)?.let { return it }
        extractVersion(runCatching { connection?.metaData?.databaseProductVersion }.getOrNull())?.let { return it }
        return productVersion.takeUnless { it.isNullOrBlank() } ?: FALLBACK_VERSION
    }

    private fun extractVersion(value: String?): String? =
        if (value.isNullOrBlank()) null else VERSION_REGEX.find(value)?.value

    companion object {
        private const val DBMS_NAME = "TDENGINE"
        private const val PRODUCT_NAME = "TDengine"
        private const val FALLBACK_VERSION = "3"
        private val VERSION_REGEX = Regex("""\d+(?:\.\d+)+""")
    }
}
