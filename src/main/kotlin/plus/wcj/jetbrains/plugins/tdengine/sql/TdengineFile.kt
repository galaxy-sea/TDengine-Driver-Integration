package plus.wcj.jetbrains.plugins.tdengine.sql

import com.intellij.psi.FileViewProvider
import com.intellij.sql.psi.SqlElement
import com.intellij.sql.psi.SqlStatement
import com.intellij.sql.psi.impl.SqlFileImpl

class TdengineFile(viewProvider: FileViewProvider) : SqlFileImpl(viewProvider, TdengineSqlDialect.INSTANCE) {
    override fun getDdl(): List<SqlElement> {
        return children.filterIsInstance<SqlStatement>()
    }

    override fun toString(): String = "TDengine SQL"
}
