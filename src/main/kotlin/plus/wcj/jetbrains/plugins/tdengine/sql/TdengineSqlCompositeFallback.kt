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
import com.intellij.sql.psi.SqlVisitor

// 测试连接和 keep-alive 生成的部分 SQL 节点会以 SqlElementType 进入这里，
// 但 SqlElementFactory 无法为当前自定义方言构造对应 PSI。
// 这里提供一个兼容 SqlElement 的兜底包装，保证 DatabaseTools 仍能遍历语法树。
class TdengineSqlCompositeFallback(node: ASTNode) : ASTWrapperPsiElement(node), SqlCompositeElement {
    override fun accept(visitor: SqlVisitor) {
        visitor.visitSqlElement(this)
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
