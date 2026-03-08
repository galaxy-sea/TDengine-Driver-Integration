package plus.wcj.jetbrains.plugins.tdengine.sql

import com.intellij.codeInsight.AutoPopupController
import com.intellij.codeInsight.completion.InsertHandler
import com.intellij.codeInsight.completion.InsertionContext
import com.intellij.codeInsight.lookup.LookupElement

object TdengineCompletionInsertHandler {
    val KEYWORD: InsertHandler<LookupElement> = InsertHandler { context, _ ->
        val offset = context.tailOffset
        val chars = context.document.charsSequence
        if (offset >= chars.length) {
            context.document.insertString(offset, " ")
            return@InsertHandler
        }
        val next = chars[offset]
        if (next.isWhitespace() || next == ',' || next == ';' || next == ')' || next == '(') {
            return@InsertHandler
        }
        context.document.insertString(offset, " ")
    }

    val FUNCTION: InsertHandler<LookupElement> = InsertHandler { context, _ ->
        val offset = context.tailOffset
        val chars = context.document.charsSequence
        if (offset < chars.length && chars[offset] == '(') {
            context.editor.caretModel.moveToOffset(offset + 1)
        } else {
            context.document.insertString(offset, "()")
            context.editor.caretModel.moveToOffset(offset + 1)
        }
        AutoPopupController.getInstance(context.project).autoPopupParameterInfo(context.editor, null)
    }
}
