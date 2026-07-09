import com.android.build.gradle.BaseExtension

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// Some plugin dependencies (e.g. file_picker) hardcode their own
// compileSdk instead of deferring to the app module's setting, and can
// lag behind a transitive dependency's requirement (here,
// flutter_plugin_android_lifecycle needs compileSdk 36+). Force every
// Android subproject to compile against at least 36 so plugin builds
// stay in sync with the app module without needing to touch pubspec
// dependency versions.
subprojects {
    afterEvaluate {
        extensions.findByType(BaseExtension::class.java)?.apply {
            compileSdkVersion(36)
        }
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
