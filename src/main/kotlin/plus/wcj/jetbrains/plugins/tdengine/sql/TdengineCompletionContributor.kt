package plus.wcj.jetbrains.plugins.tdengine.sql

import com.intellij.codeInsight.completion.CompletionContributor
import com.intellij.codeInsight.completion.CompletionParameters
import com.intellij.codeInsight.completion.CompletionResultSet
import com.intellij.codeInsight.completion.PlainPrefixMatcher
import com.intellij.codeInsight.lookup.LookupElementBuilder
import com.intellij.psi.PsiElement

@Suppress("OVERRIDE_DEPRECATION")
class TdengineCompletionContributor : CompletionContributor() {
    override fun fillCompletionVariants(parameters: CompletionParameters, result: CompletionResultSet) {
        if (!isTdengineContext(parameters.position)) {
            return
        }

        val caseInsensitiveResult = result.withPrefixMatcher(
            PlainPrefixMatcher(currentPrefix(parameters), false)
        )
        addFunctionCompletions(caseInsensitiveResult)
        addKeywordCompletions(caseInsensitiveResult)
    }

    override fun invokeAutoPopup(position: PsiElement, typeChar: Char): Boolean {
        return isTdengineContext(position) && isIdentifierPart(typeChar)
    }

    private fun isTdengineContext(position: PsiElement): Boolean {
        return TdengineContextSupport.isTdengineContext(position)
    }

    private fun currentPrefix(parameters: CompletionParameters): String {
        val text = parameters.editor.document.charsSequence
        var index = parameters.offset
        while (index > 0 && isIdentifierPart(text[index - 1])) {
            index--
        }
        return text.subSequence(index, parameters.offset).toString()
    }

    private fun isIdentifierPart(ch: Char): Boolean {
        return ch == '_' || ch.isLetterOrDigit()
    }

    private fun addKeywordCompletions(result: CompletionResultSet) {
        TdengineLexerUtil.keywordNames().forEach { keyword ->
            if (keyword in TdengineFunctionRegistry.names()) {
                return@forEach
            }
            result.addElement(
                LookupElementBuilder.create(keyword)
                    .withBoldness(true)
                    .withTypeText("keyword", true)
                    .withRenderer(TdengineLookupRenderers.KEYWORD)
                    .withInsertHandler(TdengineCompletionInsertHandler.KEYWORD)
            )
        }
    }

    private fun addFunctionCompletions(result: CompletionResultSet) {
        TdengineFunctionRegistry.allDefinitions().forEach { function ->
            result.addElement(
                LookupElementBuilder.create(function.name)
                    .withBoldness(true)
                    .withTailText(function.signature, true)
                    .withTypeText("function", true)
                    .withRenderer(TdengineLookupRenderers.function(function.signature))
                    .withInsertHandler(TdengineCompletionInsertHandler.FUNCTION)
            )
        }
    }
}
