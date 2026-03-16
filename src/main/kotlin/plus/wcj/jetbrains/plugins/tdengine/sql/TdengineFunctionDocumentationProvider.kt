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
