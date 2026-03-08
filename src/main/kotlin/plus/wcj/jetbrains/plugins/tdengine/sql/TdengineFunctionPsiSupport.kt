package plus.wcj.jetbrains.plugins.tdengine.sql

import com.intellij.psi.PsiElement
import plus.wcj.jetbrains.plugins.tdengine.sql.grammar.psi.TdengineCurrentTimeExpression
import plus.wcj.jetbrains.plugins.tdengine.sql.grammar.psi.TdengineFunctionCall

data class TdengineFunctionTarget(
    val name: String,
    val nameElement: PsiElement,
    val definitions: List<TdengineFunctionDefinition>
)

object TdengineFunctionPsiSupport {
    fun findTarget(element: PsiElement?): TdengineFunctionTarget? {
        var current = element
        while (current != null) {
            val target = when (current) {
                is TdengineFunctionCall -> fromFunctionCall(current)
                is TdengineCurrentTimeExpression -> fromSimpleFunction(current)
                else -> null
            }
            if (target != null) {
                return target
            }
            current = current.parent
        }
        return null
    }

    fun functionName(call: TdengineFunctionCall): String? {
        return when {
            call.functionName != null -> call.functionName?.text
            call.castFunctionCall != null -> "CAST"
            else -> null
        }
    }

    private fun fromFunctionCall(call: TdengineFunctionCall): TdengineFunctionTarget? {
        val name = functionName(call) ?: return null
        val nameElement = call.functionName?.firstChild ?: call.castFunctionCall?.firstChild ?: return null
        return buildTarget(name, nameElement)
    }

    private fun fromSimpleFunction(element: PsiElement): TdengineFunctionTarget? {
        val nameElement = element.firstChild ?: return null
        return buildTarget(nameElement.text, nameElement)
    }

    private fun buildTarget(name: String, nameElement: PsiElement): TdengineFunctionTarget? {
        val definitions = TdengineFunctionRegistry.find(name)
        if (definitions.isEmpty()) {
            return null
        }
        return TdengineFunctionTarget(name, nameElement, definitions)
    }
}
