plugins {
    `java-library`
    signing
    `maven-publish`
    `project-report`
    `build-dashboard`
    jacoco
    id("com.github.spotbugs")
    id("org.danilopianini.git-sensitive-semantic-versioning")
    id("org.danilopianini.javadoc.io-linker")
    id("org.danilopianini.publish-on-central")
    id("org.jlleitschuh.gradle.ktlint")
    id("org.xtext.xtend")
}

repositories {
    mavenCentral()
}

val transitiveDependenciesWorkaround by configurations.creating

dependencies {
    implementation("com.google.guava:guava:_")
    implementation("org.eclipse.xtend:org.eclipse.xtend.lib:_")
    implementation("org.apache.commons:commons-collections4:_")
    testImplementation("junit:junit:_")
    transitiveDependenciesWorkaround("org.eclipse.platform:org.eclipse.core.runtime:_")
    transitiveDependenciesWorkaround("org.eclipse.platform:org.eclipse.equinox.common:_")
}

configurations.all {
    val forcedTransitiveDependencies: Map<String, Map<String, String>> = transitiveDependenciesWorkaround
        .apply { resolve() }
        .dependencies
        .map { Triple(it.group!!, it.name, it.version!!) }
        .groupBy { (group, _, _) -> group }
        .mapValues { (_, dependencies) ->
            dependencies.map { (_, module, version) -> module to version }.toMap()
        }
    if (this != transitiveDependenciesWorkaround) {
        resolutionStrategy {
            eachDependency {
                forcedTransitiveDependencies[requested.group]
                    ?.get(requested.name)
                    ?.let { useVersion(it) }
            }
        }
    }
}

java {
    sourceCompatibility = JavaVersion.VERSION_1_8
    targetCompatibility = JavaVersion.VERSION_1_8
}

spotbugs {
    setEffort("max")
    setReportLevel("low")
    showProgress.set(true)
    val excludeFile = File("${project.rootProject.projectDir}/config/spotbugs/excludes.xml")
    if (excludeFile.exists()) {
        excludeFilter.set(excludeFile)
    }
}

tasks.withType<com.github.spotbugs.snom.SpotBugsTask> {
    reports {
        create("html") { enabled = true }
    }
}

group = "org.danilopianini"
publishOnCentral {
    projectDescription = "A collection that is both a list and a set, namely, a list without duplicates, or, in other words, an ordered set"
    projectLongName = "A Java collection that is both a List and a Set"
}

if (System.getenv("CI") == true.toString()) {
    signing {
        val signingKey: String? by project
        val signingPassword: String? by project
        useInMemoryPgpKeys(signingKey, signingPassword)
    }
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
