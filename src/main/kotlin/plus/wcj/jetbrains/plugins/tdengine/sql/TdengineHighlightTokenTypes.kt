package plus.wcj.jetbrains.plugins.tdengine.sql

import com.intellij.psi.tree.IElementType

object TdengineHighlightTokenTypes {
    val FUNCTION_IDENTIFIER = IElementType("TDENGINE_FUNCTION_IDENTIFIER", TdengineSqlDialect.INSTANCE)
}
