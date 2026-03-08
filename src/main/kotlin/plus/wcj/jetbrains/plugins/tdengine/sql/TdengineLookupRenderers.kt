package plus.wcj.jetbrains.plugins.tdengine.sql

import com.intellij.codeInsight.lookup.LookupElement
import com.intellij.codeInsight.lookup.LookupElementPresentation
import com.intellij.codeInsight.lookup.LookupElementRenderer
import com.intellij.openapi.editor.DefaultLanguageHighlighterColors
import com.intellij.openapi.editor.colors.EditorColorsManager
import com.intellij.util.PlatformIcons
import java.awt.Color

object TdengineLookupRenderers {
    fun function(signature: String): LookupElementRenderer<LookupElement> {
        return object : LookupElementRenderer<LookupElement>() {
            override fun renderElement(element: LookupElement, presentation: LookupElementPresentation) {
                presentation.itemText = element.lookupString
                colorOf(TdengineHighlightingKeys.FUNCTION)?.let { presentation.itemTextForeground = it }
                presentation.isItemTextBold = true
                presentation.tailText = signature
                presentation.typeText = "function"
                presentation.icon = PlatformIcons.FUNCTION_ICON
            }
        }
    }

    val KEYWORD: LookupElementRenderer<LookupElement> = object : LookupElementRenderer<LookupElement>() {
        override fun renderElement(element: LookupElement, presentation: LookupElementPresentation) {
            presentation.itemText = element.lookupString
            colorOf(DefaultLanguageHighlighterColors.KEYWORD)?.let { presentation.itemTextForeground = it }
            presentation.isItemTextBold = true
            presentation.typeText = "keyword"
        }
    }

    private fun colorOf(key: com.intellij.openapi.editor.colors.TextAttributesKey): Color? {
        return EditorColorsManager.getInstance().globalScheme.getAttributes(key)?.foregroundColor
    }
}
