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

import com.intellij.extapi.psi.ASTWrapperPsiElement
import com.intellij.lang.ASTNode
import com.intellij.sql.psi.SqlCompositeElement
import com.intellij.sql.psi.SqlElement
import com.intellij.sql.psi.SqlStatement
import com.intellij.sql.psi.SqlVisitor

open class TdengineSqlStatementMixin(node: ASTNode) : ASTWrapperPsiElement(node), SqlStatement, SqlCompositeElement {
    override fun accept(visitor: SqlVisitor) {
        visitor.visitSqlStatement(this)
    }

    override fun acceptChildren(visitor: SqlVisitor) {
        var child = firstChild
        while (child != null) {
            if (child is SqlElement) {
                child.accept(visitor)
            }
            child = child.nextSibling
        }
    }
}
