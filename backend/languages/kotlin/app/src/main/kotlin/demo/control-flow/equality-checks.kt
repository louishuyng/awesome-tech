package demo

val authors = setOf("Shakespeare", "Hemingway", "Twain")
val writers = setOf("Twain", "Shakespeare", "Hemingway")

fun demoEqualityChecks() {
  println("=========Demo: Equality Checks=============")
  println(authors == writers)
  println(authors === writers)
}
