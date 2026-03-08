package plus.wcj.jetbrains.plugins.tdengine.sql

import com.intellij.psi.tree.IElementType
import plus.wcj.jetbrains.plugins.tdengine.sql.grammar.psi.TdengineTokenType
import plus.wcj.jetbrains.plugins.tdengine.sql.grammar.psi.TdengineTypes
import java.util.Locale

object TdengineLexerUtil {
    private val nonKeywordTokenNames = setOf(
        "IDENTIFIER",
        "NUMBER_LITERAL",
        "ZERO_LITERAL",
        "ONE_LITERAL",
        "TWO_LITERAL",
        "STRING_LITERAL",
        "STRING_LITERAL_NONE",
        "STRING_LITERAL_LAST_ROW",
        "STRING_LITERAL_LAST_VALUE",
        "STRING_LITERAL_BOTH",
        "STRING_LITERAL_MS",
        "STRING_LITERAL_US",
        "STRING_LITERAL_NS",
        "STRING_LITERAL_SIMPLE8B",
        "STRING_LITERAL_BIT_PACKING",
        "STRING_LITERAL_DELTA_I",
        "STRING_LITERAL_DELTA_D",
        "STRING_LITERAL_DISABLED",
        "STRING_LITERAL_BSS",
        "STRING_LITERAL_LZ4",
        "STRING_LITERAL_ZLIB",
        "STRING_LITERAL_ZSTD",
        "STRING_LITERAL_TSZ",
        "STRING_LITERAL_XZ",
        "STRING_LITERAL_HIGH",
        "STRING_LITERAL_MEDIUM",
        "STRING_LITERAL_LOW",
        "STRING_LITERAL_H",
        "STRING_LITERAL_M",
        "STRING_LITERAL_L",
        "BLOCK_HINT",
        "ASTERISK",
        "COMMA_SIGN",
        "EQ_SIGN",
        "GT_SIGN",
        "LT_SIGN",
        "GE_SIGN",
        "LE_SIGN",
        "NEQ_BANG",
        "NEQ_ANGLE",
        "LPAREN",
        "RPAREN",
        "SEMICOLON",
        "DOT_SIGN",
        "COLON_SIGN",
        "PLUS_SIGN",
        "MINUS_SIGN",
        "SLASH_SIGN",
        "QUESTION_SIGN",
        "EXPORT_TO"
    )

    private val tokenTypesByName: Map<String, IElementType> = TdengineTypes::class.java.fields
        .mapNotNull { field ->
            val value = field.get(null)
            if (value is TdengineTokenType) field.name to value else null
        }
        .toMap()

    private val keywordTokenTypes: Set<IElementType> = tokenTypesByName
        .filterKeys { it !in nonKeywordTokenNames }
        .values
        .toSet()

    private val keywordNames: Set<String> = tokenTypesByName
        .filterKeys { it !in nonKeywordTokenNames }
        .keys
        .toSortedSet()

    @JvmStatic
    fun lookupKeyword(text: CharSequence, fallback: IElementType): IElementType {
        return tokenTypesByName[text.toString().uppercase(Locale.ROOT)] ?: fallback
    }

    @JvmStatic
    fun isKeywordToken(tokenType: IElementType): Boolean {
        return tokenType in keywordTokenTypes
    }

    @JvmStatic
    fun keywordNames(): Set<String> {
        return keywordNames
    }
}
