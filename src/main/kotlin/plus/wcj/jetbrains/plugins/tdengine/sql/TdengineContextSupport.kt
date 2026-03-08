package plus.wcj.jetbrains.plugins.tdengine.sql

import com.intellij.psi.PsiElement
import com.intellij.sql.psi.SqlFile

object TdengineContextSupport {
    fun isTdengineContext(element: PsiElement?): Boolean {
        val file = element?.containingFile as? SqlFile ?: return false
        return file.sqlLanguage == TdengineSqlDialect.INSTANCE
    }
}
