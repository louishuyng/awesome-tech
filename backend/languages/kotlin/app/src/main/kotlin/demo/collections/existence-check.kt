package demo

fun demoExistenceCheck() {
  println("=========Demo: Existence Check=============")

  // any function
  val numbers = listOf(1, -2, 3, -4, 5, -6)

  val anyNegative = numbers.any { it < 0 }
  val anyGT6 = numbers.any { it > 6 }

  println("Any Negative number: $anyNegative")
  println("Any Greather Than 6 number: $anyGT6")

  // all function
  var allEven = numbers.all { it % 2 == 0 }
  var allLess6 = numbers.all { it < 6 }

  println("All Even number: $allEven")
  println("Any Less Than 6 number: $allLess6")

  // none function
  allEven = numbers.none { it % 2 == 1 }
  allLess6 = numbers.none { it % 2 == 1 }

  println("All Even number: $allEven")
  println("Any Less Than 6 number: $allLess6")
}
