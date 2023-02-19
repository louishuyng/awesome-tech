package demo

fun demoPartition() {
  println("=========Demo: Partition=============")

  val numbers = listOf(1, -2, 3, -4, 5, -6)
  val evenOdd = numbers.partition { it % 2 == 0 }
  val (positives, negatives) = numbers.partition { it > 0 }

  println("Partition even Odd: $evenOdd")
  println("Positives Numbers: $positives")
  println("Negatives Numbers: $negatives")
}
