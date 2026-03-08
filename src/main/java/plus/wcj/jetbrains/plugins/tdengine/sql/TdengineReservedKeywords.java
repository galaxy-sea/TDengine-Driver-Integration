package plus.wcj.jetbrains.plugins.tdengine.sql;

import com.intellij.psi.tree.IElementType;
import plus.wcj.jetbrains.plugins.tdengine.sql.grammar.psi.TdengineTypes;

public interface TdengineReservedKeywords {
    IElementType CREATE = TdengineTypes.CREATE;
    IElementType DATABASE = TdengineTypes.DATABASE;
    IElementType TABLE = TdengineTypes.TABLE;
    IElementType STABLE = TdengineTypes.STABLE;
    IElementType TAGS = TdengineTypes.TAGS;
    IElementType USING = TdengineTypes.USING;
    IElementType INSERT = TdengineTypes.INSERT;
    IElementType INTO = TdengineTypes.INTO;
    IElementType VALUES = TdengineTypes.VALUES;
    IElementType SELECT = TdengineTypes.SELECT;
    IElementType FROM = TdengineTypes.FROM;
    IElementType WHERE = TdengineTypes.WHERE;
    IElementType KEEP = TdengineTypes.KEEP;
    IElementType PRECISION = TdengineTypes.PRECISION;
    IElementType UPDATE = TdengineTypes.UPDATE;
}
