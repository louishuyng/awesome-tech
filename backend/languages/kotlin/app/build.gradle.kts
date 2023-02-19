plugins {
  id("org.jetbrains.kotlin.jvm") version "1.6.21"

  application
}

repositories { mavenCentral() }

dependencies {
  implementation(platform("org.jetbrains.kotlin:kotlin-bom"))

  implementation("org.jetbrains.kotlin:kotlin-stdlib-jdk8")

  implementation("com.google.guava:guava:31.0.1-jre")

  testImplementation("org.jetbrains.kotlin:kotlin-test")

  testImplementation("org.jetbrains.kotlin:kotlin-test-junit")
}

application { mainClass.set("demo.MainKt") }
