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
