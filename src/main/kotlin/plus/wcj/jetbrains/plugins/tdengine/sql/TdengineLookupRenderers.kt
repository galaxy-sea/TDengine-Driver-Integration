/*
 * Copyright 2026-present The original author or authors.
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */

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
