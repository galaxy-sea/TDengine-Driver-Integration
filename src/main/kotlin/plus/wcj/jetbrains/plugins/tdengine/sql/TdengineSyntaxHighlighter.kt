package plus.wcj.jetbrains.plugins.tdengine.sql

import com.intellij.lexer.Lexer
import com.intellij.openapi.editor.DefaultLanguageHighlighterColors
import com.intellij.openapi.editor.HighlighterColors
import com.intellij.openapi.editor.colors.TextAttributesKey
import com.intellij.openapi.fileTypes.SyntaxHighlighterBase
import com.intellij.psi.TokenType
import com.intellij.psi.tree.IElementType
import plus.wcj.jetbrains.plugins.tdengine.sql.grammar.psi.TdengineTypes

class TdengineSyntaxHighlighter : SyntaxHighlighterBase() {
    override fun getHighlightingLexer(): Lexer = TdengineHighlightingLexer()

    override fun getTokenHighlights(tokenType: IElementType): Array<TextAttributesKey> {
        if (TdengineLexerUtil.isKeywordToken(tokenType)) {
            return pack(KEYWORD)
        }
        return pack(keys[tokenType])
    }

    private companion object {
        private val KEYWORD = TextAttributesKey.createTextAttributesKey(
            "TDENGINE_KEYWORD",
            DefaultLanguageHighlighterColors.KEYWORD
        )
        private val STRING = TextAttributesKey.createTextAttributesKey(
            "TDENGINE_STRING",
            DefaultLanguageHighlighterColors.STRING
        )
        private val NUMBER = TextAttributesKey.createTextAttributesKey(
            "TDENGINE_NUMBER",
            DefaultLanguageHighlighterColors.NUMBER
        )
        private val LINE_COMMENT = TextAttributesKey.createTextAttributesKey(
            "TDENGINE_LINE_COMMENT",
            DefaultLanguageHighlighterColors.LINE_COMMENT
        )
        private val BLOCK_HINT = TextAttributesKey.createTextAttributesKey(
            "TDENGINE_BLOCK_HINT",
            DefaultLanguageHighlighterColors.BLOCK_COMMENT
        )
        private val IDENTIFIER = TextAttributesKey.createTextAttributesKey(
            "TDENGINE_IDENTIFIER",
            DefaultLanguageHighlighterColors.IDENTIFIER
        )
        private val OPERATOR = TextAttributesKey.createTextAttributesKey(
            "TDENGINE_OPERATOR",
            DefaultLanguageHighlighterColors.OPERATION_SIGN
        )
        private val PARENS = TextAttributesKey.createTextAttributesKey(
            "TDENGINE_PARENS",
            DefaultLanguageHighlighterColors.PARENTHESES
        )
        private val COMMA = TextAttributesKey.createTextAttributesKey(
            "TDENGINE_COMMA",
            DefaultLanguageHighlighterColors.COMMA
        )
        private val SEMICOLON = TextAttributesKey.createTextAttributesKey(
            "TDENGINE_SEMICOLON",
            DefaultLanguageHighlighterColors.SEMICOLON
        )
        private val BAD = TextAttributesKey.createTextAttributesKey(
            "TDENGINE_BAD_CHARACTER",
            HighlighterColors.BAD_CHARACTER
        )

        private val keys = mapOf(
            TdengineTypes.STRING_LITERAL to STRING,
            TdengineTypes.STRING_LITERAL_NONE to STRING,
            TdengineTypes.STRING_LITERAL_LAST_ROW to STRING,
            TdengineTypes.STRING_LITERAL_LAST_VALUE to STRING,
            TdengineTypes.STRING_LITERAL_BOTH to STRING,
            TdengineTypes.STRING_LITERAL_MS to STRING,
            TdengineTypes.STRING_LITERAL_US to STRING,
            TdengineTypes.STRING_LITERAL_NS to STRING,
            TdengineTypes.STRING_LITERAL_SIMPLE8B to STRING,
            TdengineTypes.STRING_LITERAL_BIT_PACKING to STRING,
            TdengineTypes.STRING_LITERAL_DELTA_I to STRING,
            TdengineTypes.STRING_LITERAL_DELTA_D to STRING,
            TdengineTypes.STRING_LITERAL_DISABLED to STRING,
            TdengineTypes.STRING_LITERAL_BSS to STRING,
            TdengineTypes.STRING_LITERAL_LZ4 to STRING,
            TdengineTypes.STRING_LITERAL_ZLIB to STRING,
            TdengineTypes.STRING_LITERAL_ZSTD to STRING,
            TdengineTypes.STRING_LITERAL_TSZ to STRING,
            TdengineTypes.STRING_LITERAL_XZ to STRING,
            TdengineTypes.STRING_LITERAL_HIGH to STRING,
            TdengineTypes.STRING_LITERAL_MEDIUM to STRING,
            TdengineTypes.STRING_LITERAL_LOW to STRING,
            TdengineTypes.STRING_LITERAL_H to STRING,
            TdengineTypes.STRING_LITERAL_M to STRING,
            TdengineTypes.STRING_LITERAL_L to STRING,
            TdengineTypes.NUMBER_LITERAL to NUMBER,
            TdengineTypes.ZERO_LITERAL to NUMBER,
            TdengineTypes.ONE_LITERAL to NUMBER,
            TdengineTypes.TWO_LITERAL to NUMBER,
            TdengineHighlightTokenTypes.FUNCTION_IDENTIFIER to TdengineHighlightingKeys.FUNCTION,
            TdengineTypes.IDENTIFIER to IDENTIFIER,
            TdengineTypes.EQ_SIGN to OPERATOR,
            TdengineTypes.GT_SIGN to OPERATOR,
            TdengineTypes.LT_SIGN to OPERATOR,
            TdengineTypes.GE_SIGN to OPERATOR,
            TdengineTypes.LE_SIGN to OPERATOR,
            TdengineTypes.NEQ_BANG to OPERATOR,
            TdengineTypes.NEQ_ANGLE to OPERATOR,
            TdengineTypes.ASTERISK to OPERATOR,
            TdengineTypes.PLUS_SIGN to OPERATOR,
            TdengineTypes.MINUS_SIGN to OPERATOR,
            TdengineTypes.SLASH_SIGN to OPERATOR,
            TdengineTypes.LPAREN to PARENS,
            TdengineTypes.RPAREN to PARENS,
            TdengineTypes.COMMA_SIGN to COMMA,
            TdengineTypes.SEMICOLON to SEMICOLON,
            TdengineTypes.BLOCK_HINT to BLOCK_HINT,
            TdengineTokenTypes.LINE_COMMENT to LINE_COMMENT,
            TokenType.BAD_CHARACTER to BAD
        )
    }
}
