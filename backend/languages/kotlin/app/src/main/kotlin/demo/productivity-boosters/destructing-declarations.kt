package demo

fun findMin(list: List<Int>): Int? {
  return list.reduce { a: Int, b: Int -> a.coerceAtMost(b) }
}

fun findMax(list: List<Int>): Int? {
  return list.reduce { a: Int, b: Int -> a.coerceAtLeast(b) }
}

fun findMinMax(list: List<Int>): Pair<Int?, Int?> {
  return Pair(findMin(list), findMax(list))
}

data class UserDestructing(val username: String, val email: String) // 1

fun getUser() = UserDestructing("Mary", "mary@somewhere.com")

class Pair<K, V>(val first: K, val second: V) {
  operator fun component1(): K {
    return first
  }

  operator fun component2(): V {
    return second
  }
}

fun demoDestructingDeclarations() {
  println("=========Demo: Destructing Declarations=============")

  val (x, y, z) = arrayOf(5, 10, 15)
  println("x: $x, y: $y, z: $z")
  val map = mapOf("Alice" to 21, "Bob" to 25)

  for ((name, age) in map) {
    println("$name is $age years old")
  }

  val (min, max) = findMinMax(listOf(100, 90, 50, 98, 76, 83))

  println("Min: $min, Max: $max")

  val user = getUser()
  val (username, email) = user

  println("$username: $username, email: $email")
  println(username == user.component1())

  val (_, emailAddress) = getUser()
  println("$email: $emailAddress")

  val (num, name) = Pair(1, "one") // 2

  println("num = $num, name = $name")
}
