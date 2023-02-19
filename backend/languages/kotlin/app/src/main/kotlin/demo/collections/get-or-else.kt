package demo

fun demoGetOrElse() {
  println("=========Demo: Get Or Else=============")

  // List
  val list = listOf(0, 10, 20)

  println("Get Or Else 1: ${list.getOrElse(1) { 42 }}")
  println("Get Or Else 10: ${list.getOrElse(10) { 42 }}")

  // Map
  val map = mutableMapOf<String, Int?>()
  println("Get Or Else X:  ${map.getOrElse("x") { 1 }}")

  map["x"] = 3
  println("Get Or Else X:  ${map.getOrElse("x") { 1 }}")

  map["x"] = null
  println("Get Or Else X:  ${map.getOrElse("x") { 1 }}")
}
