package plus.wcj.jetbrains.plugins.tdengine.sql

import com.intellij.lang.Commenter

class TdengineCommenter : Commenter {
    override fun getLineCommentPrefix(): String = "--"

    override fun getBlockCommentPrefix(): String? = null

    override fun getBlockCommentSuffix(): String? = null

    override fun getCommentedBlockCommentPrefix(): String? = null

    override fun getCommentedBlockCommentSuffix(): String? = null
}
