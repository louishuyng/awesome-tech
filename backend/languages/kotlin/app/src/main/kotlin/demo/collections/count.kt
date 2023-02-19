package demo

fun demoCount() {
  println("=========Demo: Count=============")
  val numbers = listOf(1, -2, 3, -4, 5, -6)

  val totalCount = numbers.count()
  val evenCount = numbers.count { it % 2 == 0 }

  println("Total count: $totalCount")
  println("Even count: $evenCount")
}
