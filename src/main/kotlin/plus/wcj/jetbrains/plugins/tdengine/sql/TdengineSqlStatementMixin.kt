package plus.wcj.jetbrains.plugins.tdengine.sql

import com.intellij.extapi.psi.ASTWrapperPsiElement
import com.intellij.lang.ASTNode
import com.intellij.sql.psi.SqlCompositeElement
import com.intellij.sql.psi.SqlElement
import com.intellij.sql.psi.SqlStatement
import com.intellij.sql.psi.SqlVisitor

open class TdengineSqlStatementMixin(node: ASTNode) : ASTWrapperPsiElement(node), SqlStatement, SqlCompositeElement {
    override fun accept(visitor: SqlVisitor) {
        visitor.visitSqlStatement(this)
    }

    override fun acceptChildren(visitor: SqlVisitor) {
        var child = firstChild
        while (child != null) {
            if (child is SqlElement) {
                child.accept(visitor)
            }
            child = child.nextSibling
        }
    }
}
