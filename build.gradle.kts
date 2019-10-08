import com.github.spotbugs.SpotBugsTask

plugins {
    `java-library`
    signing
    `maven-publish`
    `project-report`
    `build-dashboard`
    jacoco
    id("com.github.spotbugs") version Versions.com_github_spotbugs_gradle_plugin
    id("de.fayard.buildSrcVersions") version Versions.de_fayard_buildsrcversions_gradle_plugin
    id("org.danilopianini.git-sensitive-semantic-versioning") version Versions.org_danilopianini_git_sensitive_semantic_versioning_gradle_plugin
    id("org.danilopianini.javadoc.io-linker") version Versions.org_danilopianini_javadoc_io_linker_gradle_plugin
    id("org.danilopianini.publish-on-central") version Versions.org_danilopianini_publish_on_central_gradle_plugin
    id("org.jlleitschuh.gradle.ktlint") version "7.4.0"
    id("org.xtext.xtend") version Versions.org_xtext_xtend_gradle_plugin
}

gitSemVer {
    version = computeGitSemVer()
}

repositories {
    mavenCentral()
}

dependencies {
    implementation(Libs.guava)
    implementation(Libs.org_eclipse_xtend_lib)
    implementation(Libs.commons_collections4)
    testImplementation(Libs.junit)
}

java {
    sourceCompatibility = JavaVersion.VERSION_1_8
    targetCompatibility = JavaVersion.VERSION_1_8
}

tasks.withType<SpotBugsTask> {
    reports {
        xml.setEnabled(false)
        html.setEnabled(true)
    }
    ignoreFailures = false
    effort = "max"
    reportLevel = "low"
    File("${project.rootProject.projectDir}/config/spotbugs/excludes.xml")
        .takeIf { it.exists() }
        ?.also { excludeFilterConfig = project.resources.text.fromFile(it) }
        ?.also { println(it) }
}

group = "org.danilopianini"
publishOnCentral {
    projectDescription.set("A collection that is both a list and a set, namely, a list without duplicates, or, in other words, an ordered set")
    projectLongName.set("A Java collection that is both a List and a Set")
}

signing {
    val signingKey: String? by project
    val signingPassword: String? by project
    useInMemoryPgpKeys(signingKey, signingPassword)
}

publishing {
    publications {
        withType<MavenPublication> {
            pom {
                developers {
                    developer {
                        name.set("Danilo Pianini")
                        email.set("danilo.pianini@gmail.com")
                        url.set("http://www.danilopianini.org/")
                    }
                }
            }
        }
    }
}
