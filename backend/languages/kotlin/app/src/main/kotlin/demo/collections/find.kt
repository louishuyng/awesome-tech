package demo

fun demoFind() {
  println("=========Demo: Find and Find Last=============")

  val words = listOf("Lets", "find", "something", "in", "collection", "somehow")

  val first = words.find { it.startsWith("some") }
  val last = words.findLast { it.startsWith("some") }

  val nothing = words.find { it.contains("nothing") }

  println("Find word start with some: $first")
  println("Find last word start with some: $last")
  println("Find word contains nothing: $nothing")
}
