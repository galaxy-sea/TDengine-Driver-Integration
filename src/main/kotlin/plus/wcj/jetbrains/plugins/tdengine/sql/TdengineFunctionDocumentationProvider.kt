package plus.wcj.jetbrains.plugins.tdengine.sql

import com.intellij.lang.documentation.AbstractDocumentationProvider
import com.intellij.openapi.editor.Editor
import com.intellij.openapi.util.text.StringUtil
import com.intellij.psi.PsiElement
import com.intellij.psi.PsiFile

class TdengineFunctionDocumentationProvider : AbstractDocumentationProvider() {
    override fun getCustomDocumentationElement(
        editor: Editor,
        file: PsiFile,
        contextElement: PsiElement?,
        targetOffset: Int
    ): PsiElement? {
        if (!TdengineContextSupport.isTdengineContext(contextElement)) {
            return null
        }
        return TdengineFunctionPsiSupport.findTarget(contextElement)?.nameElement
    }

    override fun generateDoc(element: PsiElement?, originalElement: PsiElement?): String? {
        if (!TdengineContextSupport.isTdengineContext(element) &&
            !TdengineContextSupport.isTdengineContext(originalElement)
        ) {
            return null
        }
        val target = TdengineFunctionPsiSupport.findTarget(element)
            ?: TdengineFunctionPsiSupport.findTarget(originalElement)
            ?: return null

        return buildString {
            target.definitions.forEachIndexed { index, definition ->
                if (index > 0) {
                    append("<hr/>")
                }
                append("<div class='definition'><pre>")
                append(StringUtil.escapeXmlEntities("${definition.name}${definition.signature}"))
                append("</pre></div>")
                if (definition.description.isNotBlank()) {
                    append("<div class='content'>")
                    append(StringUtil.escapeXmlEntities(definition.description))
                    append("</div>")
                }
            }
        }
    }

    override fun getQuickNavigateInfo(element: PsiElement?, originalElement: PsiElement?): String? {
        if (!TdengineContextSupport.isTdengineContext(element) &&
            !TdengineContextSupport.isTdengineContext(originalElement)
        ) {
            return null
        }
        val target = TdengineFunctionPsiSupport.findTarget(element)
            ?: TdengineFunctionPsiSupport.findTarget(originalElement)
            ?: return null

        return target.definitions.joinToString(" | ") { "${it.name}${it.signature}" }
    }
}
