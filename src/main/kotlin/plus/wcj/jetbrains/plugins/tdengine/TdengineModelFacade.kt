package plus.wcj.jetbrains.plugins.tdengine

import com.intellij.database.Dbms
import com.intellij.database.dialects.generic.model.GenericMetaModel
import com.intellij.database.dialects.generic.model.GenericModelHelper
import com.intellij.database.model.ModelFacade
import com.intellij.database.model.ModelHelper
import com.intellij.database.model.meta.BasicMetaModel

class TdengineModelFacade(dbms: Dbms) : ModelFacade(dbms) {
    private val helper = GenericModelHelper(dbms)

    override fun getMetaModel(): BasicMetaModel<*> {
        return GenericMetaModel.MODEL
    }

    override fun getModelHelper(): ModelHelper {
        return helper
    }
}
