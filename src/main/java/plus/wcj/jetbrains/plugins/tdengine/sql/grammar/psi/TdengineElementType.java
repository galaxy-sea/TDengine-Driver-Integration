package plus.wcj.jetbrains.plugins.tdengine.sql.grammar.psi;

import com.intellij.psi.tree.IElementType;
import com.intellij.sql.psi.SqlLanguage;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;

public class TdengineElementType extends IElementType {
    public TdengineElementType(@NotNull @NonNls String debugName) {
        super(debugName, SqlLanguage.INSTANCE);
    }
}
