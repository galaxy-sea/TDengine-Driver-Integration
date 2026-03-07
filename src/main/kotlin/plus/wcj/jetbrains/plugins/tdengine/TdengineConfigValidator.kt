package plus.wcj.jetbrains.plugins.tdengine

import com.intellij.database.dataSource.LocalDataSource
import com.intellij.database.dataSource.validation.DataSourceProblem
import com.intellij.database.dataSource.validation.DatabaseConfigValidator
import com.intellij.database.view.ui.ActualConfigInfoProvider
import com.intellij.openapi.project.Project
import com.intellij.util.Consumer
import java.net.URI

class TdengineConfigValidator : DatabaseConfigValidator<LocalDataSource>() {
    override fun getTargetClass(): Class<out LocalDataSource> = LocalDataSource::class.java

    override fun collectProblems(
        project: Project,
        target: LocalDataSource,
        problems: Consumer<in DataSourceProblem>,
        actualConfigInfoProvider: ActualConfigInfoProvider?
    ) {
        if (!isTdengine(target)) {
            return
        }

        val driverClass = target.driverClass.orEmpty().trim()
        if (driverClass.isBlank()) {
            report(
                problems = problems,
                target = target,
                id = "tdengine.driverClass.missing",
                level = DataSourceProblem.Level.ERROR,
                message = "TDengine requires a JDBC driver class.",
                description = "Use $DEFAULT_DRIVER_CLASS as the default TDengine JDBC driver class."
            )
            return
        }

        if (driverClass !in SUPPORTED_DRIVER_CLASSES) {
            report(
                problems = problems,
                target = target,
                id = "tdengine.driverClass.unsupported",
                level = DataSourceProblem.Level.ERROR,
                message = "Unsupported TDengine JDBC driver class: $driverClass.",
                description = "Use $DEFAULT_DRIVER_CLASS for WebSocket connections or $NATIVE_DRIVER_CLASS for native connections."
            )
            return
        }

        val expectedPrefix = expectedPrefix(driverClass)
        val url = target.url.orEmpty().trim()
        if (url.isBlank()) {
            report(
                problems = problems,
                target = target,
                id = "tdengine.url.missing",
                level = DataSourceProblem.Level.ERROR,
                message = "TDengine requires a JDBC URL.",
                description = "Use $expectedPrefix{host}:{port}/{database} as the TDengine JDBC URL template."
            )
            return
        }

        if (!url.startsWith(expectedPrefix, ignoreCase = true)) {
            report(
                problems = problems,
                target = target,
                id = "tdengine.url.prefix",
                level = DataSourceProblem.Level.ERROR,
                message = "TDengine JDBC URL must start with $expectedPrefix.",
                description = "The selected TDengine driver class must match the JDBC URL prefix."
            )
            return
        }

        val uri = runCatching { URI(url.substring(JDBC_PREFIX.length)) }.getOrNull()
        if (uri == null) {
            report(
                problems = problems,
                target = target,
                id = "tdengine.url.invalid",
                level = DataSourceProblem.Level.ERROR,
                message = "TDengine JDBC URL is malformed.",
                description = "Expected a URL like ${expectedPrefix}localhost:${defaultPort(driverClass)}/test."
            )
            return
        }

        if (uri.host.isNullOrBlank()) {
            report(
                problems = problems,
                target = target,
                id = "tdengine.host.missing",
                level = DataSourceProblem.Level.ERROR,
                message = "TDengine host is missing from the JDBC URL.",
                description = "Specify a host in the form ${expectedPrefix}localhost:${defaultPort(driverClass)}/test."
            )
            return
        }

        if (uri.port == -1) {
            report(
                problems = problems,
                target = target,
                id = "tdengine.port.missing",
                level = DataSourceProblem.Level.WARNING,
                message = "TDengine JDBC URL does not specify a port.",
                description = "The default ${connectionMode(driverClass)} port is ${defaultPort(driverClass)}."
            )
        } else if (uri.port !in 1..65535) {
            report(
                problems = problems,
                target = target,
                id = "tdengine.port.invalid",
                level = DataSourceProblem.Level.ERROR,
                message = "TDengine port must be between 1 and 65535.",
                description = "Review the port segment in the TDengine JDBC URL."
            )
            return
        }

        val database = uri.path.orEmpty().trim('/')
        if (database.isBlank()) {
            report(
                problems = problems,
                target = target,
                id = "tdengine.database.missing",
                level = DataSourceProblem.Level.WARNING,
                message = "TDengine JDBC URL does not include a default database.",
                description = "Adding /{database} makes the SQL Console start against the expected database."
            )
        }
    }

    private fun isTdengine(target: LocalDataSource): Boolean {
        val driver = target.databaseDriver
        val driverId = driver?.id.orEmpty()
        val driverName = driver?.name.orEmpty()
        val driverClass = target.driverClass.orEmpty()
        val url = target.url.orEmpty()

        return driverId.startsWith("tdengine") ||
            driverName.startsWith("TDengine", ignoreCase = true) ||
            driverClass.startsWith("com.taosdata.jdbc", ignoreCase = true) ||
            url.startsWith("jdbc:TAOS", ignoreCase = true)
    }

    private fun expectedPrefix(driverClass: String): String = when (driverClass) {
        NATIVE_DRIVER_CLASS -> NATIVE_URL_PREFIX
        else -> WEBSOCKET_URL_PREFIX
    }

    private fun defaultPort(driverClass: String): Int = when (driverClass) {
        NATIVE_DRIVER_CLASS -> 6030
        else -> 6041
    }

    private fun connectionMode(driverClass: String): String = when (driverClass) {
        NATIVE_DRIVER_CLASS -> "native"
        else -> "WebSocket"
    }

    private fun report(
        problems: Consumer<in DataSourceProblem>,
        target: LocalDataSource,
        id: String,
        level: DataSourceProblem.Level,
        message: String,
        description: String
    ) {
        val text = DataSourceProblem.HyperText(TITLE, message, description)
        problems.consume(DataSourceProblem(target, id, level, text, null))
    }

    private companion object {
        const val TITLE = "TDengine configuration"
        const val JDBC_PREFIX = "jdbc:"
        const val DEFAULT_DRIVER_CLASS = "com.taosdata.jdbc.ws.WebSocketDriver"
        const val NATIVE_DRIVER_CLASS = "com.taosdata.jdbc.TSDBDriver"
        const val WEBSOCKET_URL_PREFIX = "jdbc:TAOS-WS://"
        const val NATIVE_URL_PREFIX = "jdbc:TAOS://"

        val SUPPORTED_DRIVER_CLASSES = setOf(DEFAULT_DRIVER_CLASS, NATIVE_DRIVER_CLASS)
    }
}
