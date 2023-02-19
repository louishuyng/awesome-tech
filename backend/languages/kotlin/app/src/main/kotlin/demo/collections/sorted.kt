package demo

import kotlin.math.abs

fun demoSorted() {
  println("=========Demo: Sorted=============")

  val shuffled = listOf(5, 4, 2, 1, 3, -10)

  println("Natural Sorted: ${shuffled.sorted()}")
  println("Inverted Sorted: ${shuffled.sortedBy { -it}}")
  println("Descending Sorted: ${shuffled.sortedDescending()}}")
  println("Descending By Sorted: ${shuffled.sortedByDescending { abs(it) }}")
}
