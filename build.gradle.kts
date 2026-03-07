plugins {
    id("java")
    id("org.jetbrains.kotlin.jvm") version "2.1.20"
    id("org.jetbrains.intellij.platform") version "2.10.2"
}

group = "plus.wcj.jetbrains.plugins"
version = "1.0-SNAPSHOT"

repositories {
    mavenCentral()
    intellijPlatform {
        defaultRepositories()
    }
}

// Read more: https://plugins.jetbrains.com/docs/intellij/tools-intellij-platform-gradle-plugin.html
dependencies {
    intellijPlatform {
        // Build against IntelliJ IDEA Ultimate 2024.3 (contains Database plugin) to target IDEA/DataGrip 2024.3+.
        // intellijIdeaUltimate("2024.3")
        datagrip("2024.3")
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
}

tasks {
    // Set the JVM compatibility versions
    withType<JavaCompile> {
        sourceCompatibility = "21"
        targetCompatibility = "21"
    }
}

kotlin {
    compilerOptions {
        jvmTarget.set(org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_21)
    }
}
