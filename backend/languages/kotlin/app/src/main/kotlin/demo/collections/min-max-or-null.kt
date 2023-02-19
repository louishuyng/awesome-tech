package demo
val numbers = listOf(1, 2, 3)
val empty = emptyList<Int>()
val only = listOf(3)

fun demoMinMaxOrNull() {
  println("=========Demo: Min Max Or Null=============")
  println("Numbers: $numbers, min = ${numbers.minOrNull()} max = ${numbers.maxOrNull()}") // 1
  println("Empty: $empty, min = ${empty.minOrNull()}, max = ${empty.maxOrNull()}") // 2
  println("Only: $only, min = ${only.minOrNull()}, max = ${only.maxOrNull()}")
}
