package plus.wcj.jetbrains.plugins.tdengine

import com.intellij.database.Dbms
import com.intellij.openapi.util.IconLoader

object TdengineDbms {
    private val icon = IconLoader.getIcon("/icons/tdengine.svg", TdengineDbms::class.java)

    @JvmField
    val TDENGINE: Dbms = Dbms.create(
        "TDENGINE",
        "TDengine",
        { icon },
        Dbms.defaultPattern("tdengine|taos")
    )
}
