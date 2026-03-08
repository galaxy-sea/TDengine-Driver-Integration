package plus.wcj.jetbrains.plugins.tdengine.sql

import com.intellij.openapi.editor.colors.TextAttributesKey
import com.intellij.sql.editor.SqlColors

object TdengineHighlightingKeys {
    val FUNCTION = TextAttributesKey.createTextAttributesKey(
        "TDENGINE_FUNCTION",
        SqlColors.SQL_PROCEDURE
    )
}
