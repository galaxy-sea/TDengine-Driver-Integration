package plus.wcj.jetbrains.plugins.tdengine.sql

import com.intellij.extapi.psi.ASTWrapperPsiElement
import com.intellij.lang.ASTNode
import com.intellij.sql.psi.SqlCompositeElement
import com.intellij.sql.psi.SqlElement
import com.intellij.sql.psi.SqlVisitor

// 测试连接和 keep-alive 生成的部分 SQL 节点会以 SqlElementType 进入这里，
// 但 SqlElementFactory 无法为当前自定义方言构造对应 PSI。
// 这里提供一个兼容 SqlElement 的兜底包装，保证 DatabaseTools 仍能遍历语法树。
class TdengineSqlCompositeFallback(node: ASTNode) : ASTWrapperPsiElement(node), SqlCompositeElement {
    override fun accept(visitor: SqlVisitor) {
        visitor.visitSqlElement(this)
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
