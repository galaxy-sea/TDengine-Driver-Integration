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

import com.intellij.lang.ASTNode
import com.intellij.lang.ParserDefinition
import com.intellij.lexer.Lexer
import com.intellij.openapi.project.Project
import com.intellij.psi.FileViewProvider
import com.intellij.psi.PsiElement
import com.intellij.psi.PsiFile
import com.intellij.psi.TokenType
import com.intellij.psi.tree.IFileElementType
import com.intellij.psi.tree.TokenSet
import com.intellij.lang.PsiParser
import com.intellij.sql.dialects.base.SqlElementFactory
import com.intellij.sql.psi.SqlElementType
import plus.wcj.jetbrains.plugins.tdengine.sql.grammar.TdengineGrammarParser
import plus.wcj.jetbrains.plugins.tdengine.sql.grammar.psi.TdengineElementType
import plus.wcj.jetbrains.plugins.tdengine.sql.grammar.psi.TdengineTypes

class TdengineParserDefinition : ParserDefinition {
    override fun createLexer(project: Project): Lexer {
        return TdengineLexer()
    }

    override fun createParser(project: Project): PsiParser {
        return TdengineGrammarParser()
    }

    override fun getFileNodeType(): IFileElementType {
        return TDENGINE_SQL_FILE
    }

    override fun getWhitespaceTokens(): TokenSet {
        return TokenSet.create(TokenType.WHITE_SPACE)
    }

    override fun getCommentTokens(): TokenSet {
        return TokenSet.create(TdengineTokenTypes.LINE_COMMENT)
    }

    override fun getStringLiteralElements(): TokenSet {
        return TokenSet.create(
            TdengineTypes.STRING_LITERAL,
            TdengineTypes.STRING_LITERAL_NONE,
            TdengineTypes.STRING_LITERAL_LAST_ROW,
            TdengineTypes.STRING_LITERAL_LAST_VALUE,
            TdengineTypes.STRING_LITERAL_BOTH,
            TdengineTypes.STRING_LITERAL_MS,
            TdengineTypes.STRING_LITERAL_US,
            TdengineTypes.STRING_LITERAL_NS,
            TdengineTypes.STRING_LITERAL_SIMPLE8B,
            TdengineTypes.STRING_LITERAL_BIT_PACKING,
            TdengineTypes.STRING_LITERAL_DELTA_I,
            TdengineTypes.STRING_LITERAL_DELTA_D,
            TdengineTypes.STRING_LITERAL_DISABLED,
            TdengineTypes.STRING_LITERAL_BSS,
            TdengineTypes.STRING_LITERAL_LZ4,
            TdengineTypes.STRING_LITERAL_ZLIB,
            TdengineTypes.STRING_LITERAL_ZSTD,
            TdengineTypes.STRING_LITERAL_TSZ,
            TdengineTypes.STRING_LITERAL_XZ,
            TdengineTypes.STRING_LITERAL_HIGH,
            TdengineTypes.STRING_LITERAL_MEDIUM,
            TdengineTypes.STRING_LITERAL_LOW,
            TdengineTypes.STRING_LITERAL_H,
            TdengineTypes.STRING_LITERAL_M,
            TdengineTypes.STRING_LITERAL_L
        )
    }

    override fun createElement(node: ASTNode): PsiElement {
        val elementType = node.elementType
        return when (elementType) {
            is TdengineElementType -> TdengineTypes.Factory.createElement(node)
            is SqlElementType -> runCatching { sqlElementFactory.createCompositeElement(node) }
                .getOrElse { TdengineSqlCompositeFallback(node) }
            else -> error("Unknown element type: $elementType.")
        }
    }

    override fun createFile(viewProvider: FileViewProvider): PsiFile {
        return TdengineFile(viewProvider)
    }

    override fun spaceExistenceTypeBetweenTokens(left: ASTNode, right: ASTNode): ParserDefinition.SpaceRequirements {
        return ParserDefinition.SpaceRequirements.MAY
    }

    private companion object {
        private val TDENGINE_SQL_FILE = IFileElementType(TdengineSqlDialect.INSTANCE)
        private val sqlElementFactory = SqlElementFactory()
    }
}
