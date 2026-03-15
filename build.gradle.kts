import java.time.LocalDateTime
import java.time.format.DateTimeFormatter
import org.jetbrains.grammarkit.tasks.GenerateLexerTask
import org.jetbrains.grammarkit.tasks.GenerateParserTask

plugins {
    id("java")
    id("org.jetbrains.kotlin.jvm") version "2.1.20"
    id("org.jetbrains.intellij.platform") version "2.10.2"
    id("org.jetbrains.grammarkit") version "2022.3.2.2"
}

group = "plus.wcj.jetbrains.plugins"
version = run {
    LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy.M.d.1HHmmss"))
}

repositories {
    mavenCentral()
    intellijPlatform {
        defaultRepositories()
    }
}

// Read more: https://plugins.jetbrains.com/docs/intellij/tools-intellij-platform-gradle-plugin.html
dependencies {
    testImplementation(kotlin("test"))

    intellijPlatform {
        // Build against IntelliJ IDEA Ultimate 2024.3 (contains Database plugin) to target IDEA/DataGrip 2024.3+.
        // intellijIdeaUltimate("2025.2.4")
        datagrip("2025.2.4")
        bundledPlugin("com.intellij.database")
        testFramework(org.jetbrains.intellij.platform.gradle.TestFrameworkType.Platform)
    }
}

intellijPlatform {
    pluginConfiguration {
        ideaVersion {
            sinceBuild = "243.0"
            untilBuild = provider { null }
        }

        changeNotes = """
            <h3>1.0.0</h3>
            <ul>
                <li>Add TDengine data source integration for JetBrains database tools</li>
                <li>Add built-in TDengine JDBC artifact definitions and download support</li>
                <li>Add TDengine connection configuration validation</li>
                <li>Add TDengine metadata wrapper for table introspection</li>
                <li>Add custom TDengine database icon and branding</li>
            </ul>
        """.trimIndent()
    }
    publishing {
        token = providers.gradleProperty("intellijPlatformPublishingToken")
    }
}

grammarKit {
    grammarKitRelease.set("2022.3.2")
    jflexRelease.set("1.9.2")
}

sourceSets {
    main {
        java.srcDir("src/main/gen")
    }
}

tasks {
    // Set the JVM compatibility versions
    withType<JavaCompile> {
        sourceCompatibility = "21"
        targetCompatibility = "21"
    }

    named<GenerateLexerTask>("generateLexer") {
        sourceFile.set(file("src/main/grammars/Tdengine.flex"))
        targetOutputDir.set(file("src/main/gen/plus/wcj/jetbrains/plugins/tdengine/sql/lexer"))
        purgeOldFiles.set(true)
        outputs.upToDateWhen { false }
    }

    named<GenerateParserTask>("generateParser") {
        sourceFile.set(file("src/main/grammars/Tdengine.bnf"))
        targetRootOutputDir.set(file("src/main/gen"))
        pathToParser.set("plus/wcj/jetbrains/plugins/tdengine/sql/grammar/TdengineGrammarParser.java")
        pathToPsiRoot.set("plus/wcj/jetbrains/plugins/tdengine/sql/grammar/psi")
        purgeOldFiles.set(true)
        outputs.upToDateWhen { false }
    }

    named("compileJava") {
        dependsOn("generateLexer", "generateParser")
    }

    named("compileKotlin") {
        dependsOn("generateLexer", "generateParser")
    }

    named("runIde") {
        dependsOn("generateLexer", "generateParser")
    }

    named<Test>("test") {
        useJUnitPlatform()
    }
}

kotlin {
    compilerOptions {
        jvmTarget.set(org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_21)
    }
}

val runIdeWithPsiViewer by intellijPlatformTesting.runIde.registering {

    plugins {
        plugin("PsiViewer", "252.23892.248")
    }
}
