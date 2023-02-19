package demo

fun demoFirstLast() {
  println("=========Demo: First and Last=============")

  // first, last
  val numbers = listOf(1, -2, 3, -4, 5, -6)

  val first = numbers.first()
  val last = numbers.last()

  println("First number: $first")
  println("Last number: $last")

  val firstEven = numbers.first { it % 2 == 0 }
  val lastOdd = numbers.first { it % 2 != 0 }

  println("First Even: $firstEven")
  println("Last Odd: $lastOdd")

  // firstOrNul, lastOrNull
  val words = listOf("foo", "bar", "baz", "faz") // 1
  val empty = emptyList<String>() // 2

  val firstOrNull = empty.firstOrNull() // 3
  val lastOrNull = empty.lastOrNull() // 4

  println("First or Null Words: $firstOrNull")
  println("Last or Null Words: $lastOrNull")

  val firstF = words.firstOrNull { it.startsWith('f') } // 5
  val firstZ = words.firstOrNull { it.startsWith('z') } // 6
  val lastF = words.lastOrNull { it.endsWith('f') } // 7
  val lastZ = words.lastOrNull { it.endsWith('z') }

  println("First or Null Start with F: $firstF")
  println("First or Null Start with Z: $firstZ")
  println("Last or Null Start with F: $lastF")
  println("Last or Null Start with Z: $lastZ")
}
