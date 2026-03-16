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

import com.intellij.lang.parameterInfo.CreateParameterInfoContext
import com.intellij.lang.parameterInfo.ParameterInfoHandler
import com.intellij.lang.parameterInfo.ParameterInfoUIContext
import com.intellij.lang.parameterInfo.UpdateParameterInfoContext
import com.intellij.openapi.util.TextRange
import com.intellij.psi.PsiElement
import com.intellij.psi.util.PsiTreeUtil
import plus.wcj.jetbrains.plugins.tdengine.sql.grammar.psi.TdengineFunctionCall

@Suppress("OVERRIDE_DEPRECATION")
class TdengineFunctionParameterInfoHandler :
    ParameterInfoHandler<TdengineFunctionCall, TdengineFunctionDefinition> {

    override fun couldShowInLookup(): Boolean = true

    override fun findElementForParameterInfo(context: CreateParameterInfoContext): TdengineFunctionCall? {
        val call = findFunctionCall(context.file.findElementAt(context.offset)) ?: return null
        val definitions = TdengineFunctionRegistry.find(TdengineFunctionPsiSupport.functionName(call))
        if (definitions.isEmpty()) {
            return null
        }
        context.itemsToShow = definitions.toTypedArray()
        return call
    }

    override fun showParameterInfo(element: TdengineFunctionCall, context: CreateParameterInfoContext) {
        context.showHint(element, parameterListStartOffset(element), this)
    }

    override fun findElementForUpdatingParameterInfo(context: UpdateParameterInfoContext): TdengineFunctionCall? {
        val call = findFunctionCall(context.file.findElementAt(context.offset)) ?: return null
        val callRange = call.textRange
        if (!callRange.containsOffset(context.offset)) {
            return null
        }
        return call
    }

    override fun updateParameterInfo(parameterOwner: TdengineFunctionCall, context: UpdateParameterInfoContext) {
        val range = parameterListTextRange(parameterOwner)
        if (range == null || context.offset > range.endOffset) {
            context.removeHint()
            return
        }
        context.setCurrentParameter(currentParameterIndex(parameterOwner, context.offset))
    }

    override fun updateUI(parameter: TdengineFunctionDefinition?, context: ParameterInfoUIContext) {
        if (parameter == null) {
            return
        }

        val signature = parameter.signature
        val currentParameter = context.currentParameterIndex
        val highlightRange = TdengineFunctionSignatureUtil.parameterRange(signature, currentParameter)
        val startOffset = highlightRange?.first ?: -1
        val endOffset = highlightRange?.last?.plus(1) ?: -1

        context.setupUIComponentPresentation(
            signature,
            startOffset,
            endOffset,
            context.isUIComponentEnabled.not(),
            false,
            false,
            context.defaultParameterColor
        )
    }

    private fun findFunctionCall(element: PsiElement?): TdengineFunctionCall? {
        return PsiTreeUtil.getParentOfType(element, TdengineFunctionCall::class.java, false)
    }

    private fun parameterListStartOffset(call: TdengineFunctionCall): Int {
        return call.textRange.startOffset + call.text.indexOf('(') + 1
    }

    private fun parameterListTextRange(call: TdengineFunctionCall): TextRange? {
        val text = call.text
        val openIndex = text.indexOf('(')
        val closeIndex = text.lastIndexOf(')')
        if (openIndex == -1 || closeIndex == -1 || closeIndex < openIndex) {
            return null
        }
        val start = call.textRange.startOffset + openIndex + 1
        val end = call.textRange.startOffset + closeIndex
        return TextRange(start, end)
    }

    private fun currentParameterIndex(call: TdengineFunctionCall, offset: Int): Int {
        val text = call.text
        val startOffset = call.textRange.startOffset
        val openIndex = text.indexOf('(')
        if (openIndex == -1) {
            return 0
        }

        val limit = (offset - startOffset).coerceAtMost(text.length)
        var index = 0
        var depth = 0
        var quote: Char? = null
        var position = openIndex + 1

        while (position < limit) {
            val ch = text[position]
            when {
                quote != null && ch == quote -> quote = null
                quote != null -> Unit
                ch == '\'' || ch == '"' || ch == '`' -> quote = ch
                ch == '(' -> depth++
                ch == ')' -> {
                    if (depth == 0) {
                        break
                    }
                    depth--
                }
                ch == ',' && depth == 0 -> index++
            }
            position++
        }

        return index
    }
}
