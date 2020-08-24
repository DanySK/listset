import de.fayard.refreshVersions.bootstrapRefreshVersions
import org.danilopianini.VersionAliases.justAdditionalAliases

buildscript {
    repositories {
        gradlePluginPortal()
        mavenCentral()
    }
    repositories { gradlePluginPortal() }
    dependencies {
        classpath("de.fayard.refreshVersions:refreshVersions:0.9.5")
        classpath("org.danilopianini:refreshversions-aliases:+")
    }
}

bootstrapRefreshVersions(justAdditionalAliases)

rootProject.name = "listset"
