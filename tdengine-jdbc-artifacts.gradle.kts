import java.io.ByteArrayInputStream
import java.net.URI
import javax.xml.XMLConstants
import javax.xml.parsers.DocumentBuilderFactory
import javax.xml.transform.OutputKeys
import javax.xml.transform.TransformerFactory
import javax.xml.transform.dom.DOMSource
import javax.xml.transform.stream.StreamResult
import java.io.StringWriter
import org.w3c.dom.Document
import org.w3c.dom.Element

val tdengineArtifactsFile = file("src/main/resources/config/tdengine-artifacts.xml")
val tdengineJdbcMetadataUrl = "https://repo1.maven.org/maven2/com/taosdata/jdbc/taos-jdbcdriver/maven-metadata.xml"
val tdengineJdbcArtifactId = "tdengine.jdbc"
val tdengineJdbcCoordinatePrefix = "com.taosdata.jdbc:taos-jdbcdriver:"
val versionPattern = Regex("""^(\d+)\.(\d+)\.(\d+)$""")

data class Version(val raw: String, val major: Int, val minor: Int, val patch: Int) {
    val branch = "$major.$minor"
}

fun parseVersion(raw: String): Version? {
    val match = versionPattern.matchEntire(raw.trim()) ?: return null
    return Version(raw.trim(), match.groupValues[1].toInt(), match.groupValues[2].toInt(), match.groupValues[3].toInt())
}

fun newDocumentBuilderFactory() = DocumentBuilderFactory.newInstance().apply {
    isNamespaceAware = false
    setFeature(XMLConstants.FEATURE_SECURE_PROCESSING, true)
    setFeature("http://apache.org/xml/features/disallow-doctype-decl", true)
}

fun parseDocument(xml: String): Document =
    newDocumentBuilderFactory().newDocumentBuilder()
        .parse(ByteArrayInputStream(xml.toByteArray(Charsets.UTF_8)))
        .apply { documentElement.normalize() }

fun parseDocument(file: java.io.File): Document =
    newDocumentBuilderFactory().newDocumentBuilder().parse(file).apply { documentElement.normalize() }

fun writeDocument(document: Document, target: java.io.File) {
    val transformer = TransformerFactory.newInstance().apply {
        setFeature(XMLConstants.FEATURE_SECURE_PROCESSING, true)
    }.newTransformer().apply {
        setOutputProperty(OutputKeys.INDENT, "yes")
        setOutputProperty(OutputKeys.ENCODING, "UTF-8")
        setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "2")
    }
    val writer = StringWriter()
    transformer.transform(DOMSource(document), StreamResult(writer))
    target.writeText(
        writer.toString()
            .replace("--><artifacts>", "-->\n<artifacts>")
            .replace(Regex("""<artifacts>\s*<artifact"""), "<artifacts>\n  <artifact")
    )
}

tasks.register("updateTdengineJdbcArtifacts") {
    group = "build setup"
    description = "Refreshes the latest TDengine JDBC version in tdengine-artifacts.xml before packaging."

    inputs.file(tdengineArtifactsFile)
    outputs.file(tdengineArtifactsFile)
    outputs.upToDateWhen { false }

    doLast {
        val metadataXml = runCatching {
            URI(tdengineJdbcMetadataUrl).toURL().openStream().bufferedReader().use { it.readText() }
        }.getOrElse { error ->
            logger.warn("Skip updating TDengine JDBC artifacts: failed to fetch Maven metadata from $tdengineJdbcMetadataUrl", error)
            return@doLast
        }

        val metadata = parseDocument(metadataXml)
        val versioning = metadata.getElementsByTagName("versioning").item(0) as Element
        val latestVersion = parseVersion(
            (versioning.getElementsByTagName("release").item(0) as Element).textContent
        )!!
        val metadataVersions = (versioning.getElementsByTagName("version"))
            .let { nodes ->
                (0 until nodes.length)
                    .asSequence()
                    .map { nodes.item(it) as Element }
                    .map { parseVersion(it.textContent)!! }
                    .toList()
            }

        val document = runCatching { parseDocument(tdengineArtifactsFile) }.getOrElse { error ->
            logger.warn("Skip updating TDengine JDBC artifacts: failed to parse ${tdengineArtifactsFile.path}", error)
            return@doLast
        }

        val artifact = (0 until document.getElementsByTagName("artifact").length)
            .asSequence()
            .map { document.getElementsByTagName("artifact").item(it) }
            .filterIsInstance<Element>()
            .first { it.getAttribute("id") == tdengineJdbcArtifactId }

        val existingVersionElements = (0 until artifact.childNodes.length)
            .asSequence()
            .map { artifact.childNodes.item(it) }
            .filterIsInstance<Element>()
            .filter { it.tagName == "version" }
            .toList()

        val existingVersions = existingVersionElements
            .map { it.getAttribute("version") }

        val desiredVersions = buildList {
            add(latestVersion.raw)
            addAll(
                existingVersions
                    .map { parseVersion(it)!! }
                    .map { it.branch }
                    .distinct()
                    .filterNot { it == latestVersion.branch }
                    .map { branch ->
                        metadataVersions
                            .filter { it.branch == branch }
                            .maxWithOrNull(compareBy<Version>({ it.major }, { it.minor }, { it.patch }))!!
                            .raw
                    }
            )
        }

        if (existingVersions == desiredVersions) {
            logger.lifecycle("TDengine JDBC artifacts already up to date: ${desiredVersions.joinToString()}")
            return@doLast
        }

        while (artifact.firstChild != null) {
            artifact.removeChild(artifact.firstChild)
        }

        desiredVersions.forEachIndexed { index, raw ->
            val versionElement = document.createElement("version").apply {
                setAttribute("version", raw)
                appendChild(document.createElement("item").apply {
                    setAttribute("type", "maven")
                    setAttribute("url", tdengineJdbcCoordinatePrefix + raw)
                })
                if (index == 0) {
                    appendChild(document.createElement("channel").apply {
                        setAttribute("id", "stable")
                    })
                }
            }
            artifact.appendChild(versionElement)
        }

        writeDocument(document, tdengineArtifactsFile)
        logger.lifecycle("Updated TDengine JDBC artifacts: ${existingVersions.joinToString()} -> ${desiredVersions.joinToString()}")
    }
}

tasks.named("processResources") {
    dependsOn("updateTdengineJdbcArtifacts")
}
