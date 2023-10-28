// Top-level build file where you can add configuration options common to all sub-projects/modules.
plugins {
    id("com.android.application") version "8.1.1" apply false
}
configurations.all {
    resolutionStrategy {
        force("org.jetbrains.kotlin:kotlin-stdlib:1.8.22")
        force("org.jetbrains.kotlin:kotlin-stdlib-jdk8:1.8.22")
    }
}

