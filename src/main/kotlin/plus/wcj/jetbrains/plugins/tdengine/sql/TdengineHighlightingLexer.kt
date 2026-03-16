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

import com.intellij.lexer.LexerBase
import com.intellij.psi.TokenType
import com.intellij.psi.tree.IElementType
import plus.wcj.jetbrains.plugins.tdengine.sql.grammar.psi.TdengineTypes
import java.util.Locale

class TdengineHighlightingLexer : LexerBase() {
    private data class Token(val type: IElementType, val start: Int, val end: Int)

    private var buffer: CharSequence = ""
    private var endOffset: Int = 0
    private var tokens: List<Token> = emptyList()
    private var index: Int = 0

    override fun start(buffer: CharSequence, startOffset: Int, endOffset: Int, initialState: Int) {
        this.buffer = buffer
        this.endOffset = endOffset
        tokens = collectTokens(buffer, startOffset, endOffset)
        index = 0
    }

    override fun getState(): Int = 0

    override fun getTokenType(): IElementType? = tokens.getOrNull(index)?.type

    override fun getTokenStart(): Int = tokens.getOrNull(index)?.start ?: endOffset

    override fun getTokenEnd(): Int = tokens.getOrNull(index)?.end ?: endOffset

    override fun advance() {
        if (index < tokens.size) {
            index++
        }
    }

    override fun getBufferSequence(): CharSequence = buffer

    override fun getBufferEnd(): Int = endOffset

    private fun collectTokens(buffer: CharSequence, startOffset: Int, endOffset: Int): List<Token> {
        val delegate = TdengineLexer()
        delegate.start(buffer, startOffset, endOffset, 0)

        val rawTokens = buildList {
            while (true) {
                val type = delegate.tokenType ?: break
                add(Token(type, delegate.tokenStart, delegate.tokenEnd))
                delegate.advance()
            }
        }

        if (rawTokens.isEmpty()) {
            return rawTokens
        }

        val highlighted = rawTokens.toMutableList()
        for (tokenIndex in rawTokens.indices) {
            val token = rawTokens[tokenIndex]
            if (!canBeFunctionName(token.type)) {
                continue
            }

            val tokenText = buffer.subSequence(token.start, token.end).toString()
            val canonicalName = tokenText.uppercase(Locale.ROOT)
            if (canonicalName !in TdengineFunctionRegistry.names()) {
                continue
            }

            val nextIndex = nextSignificantToken(rawTokens, tokenIndex + 1)
            val nextType = rawTokens.getOrNull(nextIndex)?.type
            val isCall = nextType == TdengineTypes.LPAREN
            val isBareNowLike = canonicalName in BARE_FUNCTIONS && isBareFunctionContext(rawTokens, tokenIndex)
            if (isCall || isBareNowLike) {
                highlighted[tokenIndex] = token.copy(type = TdengineHighlightTokenTypes.FUNCTION_IDENTIFIER)
            }
        }

        return highlighted
    }

    private fun canBeFunctionName(tokenType: IElementType): Boolean {
        return tokenType == TdengineTypes.IDENTIFIER || TdengineLexerUtil.isKeywordToken(tokenType)
    }

    private fun nextSignificantToken(tokens: List<Token>, startIndex: Int): Int {
        var index = startIndex
        while (index < tokens.size) {
            if (tokens[index].type != TokenType.WHITE_SPACE) {
                return index
            }
            index++
        }
        return -1
    }

    private fun previousSignificantToken(tokens: List<Token>, startIndex: Int): Int {
        var index = startIndex
        while (index >= 0) {
            if (tokens[index].type != TokenType.WHITE_SPACE) {
                return index
            }
            index--
        }
        return -1
    }

    private fun isBareFunctionContext(tokens: List<Token>, tokenIndex: Int): Boolean {
        val previousIndex = previousSignificantToken(tokens, tokenIndex - 1)
        val nextIndex = nextSignificantToken(tokens, tokenIndex + 1)
        val previousType = tokens.getOrNull(previousIndex)?.type
        val nextType = tokens.getOrNull(nextIndex)?.type

        val validPrevious = previousType == null ||
            previousType == TdengineTypes.SELECT ||
            previousType == TdengineTypes.WHERE ||
            previousType == TdengineTypes.COMMA_SIGN ||
            previousType == TdengineTypes.LPAREN ||
            previousType == TdengineTypes.EQ_SIGN ||
            previousType == TdengineTypes.GT_SIGN ||
            previousType == TdengineTypes.LT_SIGN ||
            previousType == TdengineTypes.GE_SIGN ||
            previousType == TdengineTypes.LE_SIGN ||
            previousType == TdengineTypes.NEQ_BANG ||
            previousType == TdengineTypes.NEQ_ANGLE ||
            previousType == TdengineTypes.PLUS_SIGN ||
            previousType == TdengineTypes.MINUS_SIGN ||
            previousType == TdengineTypes.SLASH_SIGN ||
            previousType == TdengineTypes.ASTERISK

        val validNext = nextType == null ||
            nextType == TdengineTypes.SEMICOLON ||
            nextType == TdengineTypes.COMMA_SIGN ||
            nextType == TdengineTypes.FROM ||
            nextType == TdengineTypes.WHERE ||
            nextType == TdengineTypes.GROUP ||
            nextType == TdengineTypes.ORDER ||
            nextType == TdengineTypes.LIMIT ||
            nextType == TdengineTypes.SLIMIT ||
            nextType == TdengineTypes.RPAREN

        return validPrevious && validNext
    }

    private companion object {
        val BARE_FUNCTIONS = setOf("NOW", "TODAY")
    }
}
