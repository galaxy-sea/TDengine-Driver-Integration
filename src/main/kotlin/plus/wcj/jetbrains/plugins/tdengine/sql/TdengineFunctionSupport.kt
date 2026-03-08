package plus.wcj.jetbrains.plugins.tdengine.sql

import java.io.InputStream
import java.util.Locale
import javax.xml.parsers.DocumentBuilderFactory
import org.w3c.dom.Element

data class TdengineFunctionDefinition(
    val name: String,
    val signature: String,
    val description: String
)

object TdengineFunctionRegistry {
    private const val RESOURCE_PATH = "plus/wcj/jetbrains/plugins/tdengine/sql/functions.xml"

    private val definitionsByName: Map<String, List<TdengineFunctionDefinition>> by lazy {
        loadDefinitions().groupBy { it.name.uppercase(Locale.ROOT) }
    }

    fun allDefinitions(): List<TdengineFunctionDefinition> {
        return definitionsByName.values.flatten().sortedBy { it.name }
    }

    fun names(): Set<String> {
        return definitionsByName.keys
    }

    fun find(name: String?): List<TdengineFunctionDefinition> {
        if (name.isNullOrBlank()) {
            return emptyList()
        }
        return definitionsByName[name.uppercase(Locale.ROOT)].orEmpty()
    }

    private fun loadDefinitions(): List<TdengineFunctionDefinition> {
        val stream = javaClass.classLoader.getResourceAsStream(RESOURCE_PATH) ?: return emptyList()
        return stream.use(::parseDefinitions)
    }

    private fun parseDefinitions(stream: InputStream): List<TdengineFunctionDefinition> {
        val builder = DocumentBuilderFactory.newInstance().newDocumentBuilder()
        val document = builder.parse(stream)
        val functions = document.documentElement.getElementsByTagName("function")

        return buildList(functions.length) {
            for (index in 0 until functions.length) {
                val node = functions.item(index)
                val element = node as? Element ?: continue
                val name = element.getAttribute("name").trim()
                if (name.isEmpty()) {
                    continue
                }
                add(
                    TdengineFunctionDefinition(
                        name = name,
                        signature = element.getAttribute("signature").trim(),
                        description = element.getAttribute("description").trim()
                    )
                )
            }
        }
    }
}

object TdengineFunctionSignatureUtil {
    fun parameterRange(signature: String, parameterIndex: Int): IntRange? {
        if (parameterIndex < 0) {
            return null
        }

        val openIndex = signature.indexOf('(')
        val closeIndex = signature.lastIndexOf(')')
        if (openIndex == -1 || closeIndex <= openIndex + 1) {
            return null
        }

        val content = signature.substring(openIndex + 1, closeIndex)
        val parameterRanges = splitParameters(content).map { range ->
            (range.first + openIndex + 1)..(range.last + openIndex + 1)
        }

        return parameterRanges.getOrNull(parameterIndex)
    }

    private fun splitParameters(content: String): List<IntRange> {
        val result = mutableListOf<IntRange>()
        var start = 0
        var depth = 0

        for (index in content.indices) {
            when (content[index]) {
                '(' -> depth++
                ')' -> depth--
                ',' -> if (depth == 0) {
                    result += trimRange(content, start, index)
                    start = index + 1
                }
            }
        }

        result += trimRange(content, start, content.length)
        return result.filter { !it.isEmpty() }
    }

    private fun trimRange(text: String, start: Int, endExclusive: Int): IntRange {
        var left = start
        var right = endExclusive - 1
        while (left <= right && text[left].isWhitespace()) {
            left++
        }
        while (right >= left && text[right].isWhitespace()) {
            right--
        }
        return if (left <= right) left..right else IntRange.EMPTY
    }
}
