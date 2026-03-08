package plus.wcj.jetbrains.plugins.tdengine.sql

import com.intellij.database.Dbms
import com.intellij.database.dialects.DatabaseDialects
import com.intellij.psi.tree.IElementType
import com.intellij.sql.dialects.base.SqlLanguageDialectBase
import com.intellij.sql.dialects.base.TokensHelper
import plus.wcj.jetbrains.plugins.tdengine.TdengineDbms
import plus.wcj.jetbrains.plugins.tdengine.sql.grammar.psi.TdengineTypes

class TdengineSqlDialect private constructor() : SqlLanguageDialectBase("TDengineSQL") {
    override fun createTokensHelper(): TokensHelper {
        return createTokensHelper(TdengineTokens::class.java)
    }

    override fun getDbms(): Dbms {
        return TdengineDbms.TDENGINE
    }

    override fun isOperatorSupported(tokenType: IElementType): Boolean {
        return tokenType == TdengineTypes.EQ_SIGN ||
            tokenType == TdengineTypes.GT_SIGN ||
            tokenType == TdengineTypes.LT_SIGN ||
            tokenType == TdengineTypes.GE_SIGN ||
            tokenType == TdengineTypes.LE_SIGN ||
            tokenType == TdengineTypes.NEQ_BANG ||
            tokenType == TdengineTypes.NEQ_ANGLE ||
            tokenType == TdengineTypes.ASTERISK
    }

    override fun getSystemVariables(): Set<String> {
        return emptySet()
    }

    override fun getDatabaseDialect() = DatabaseDialects.getGenericDialect()

    companion object {
        @JvmField
        val INSTANCE = TdengineSqlDialect()
    }
}
