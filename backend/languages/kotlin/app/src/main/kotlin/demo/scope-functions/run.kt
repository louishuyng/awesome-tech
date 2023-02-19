package demo

fun getNullableLength(ns: String?) {
  println("for \"$ns\":")

  ns?.run {
    println("\tis empty? " + isEmpty())
    println("\tlength = $length")
    length
  }
}

fun demoRun() {
  println("=========Demo: Run=============")
  getNullableLength(null)
  getNullableLength("")
  getNullableLength("some string with Kotlin")
}
