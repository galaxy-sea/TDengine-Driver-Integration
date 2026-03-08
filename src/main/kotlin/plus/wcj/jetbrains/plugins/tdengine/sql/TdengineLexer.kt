package plus.wcj.jetbrains.plugins.tdengine.sql

import com.intellij.lexer.FlexAdapter
import plus.wcj.jetbrains.plugins.tdengine.sql.lexer._TdengineLexer

class TdengineLexer : FlexAdapter(_TdengineLexer(null))
