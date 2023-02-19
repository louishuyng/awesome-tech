package demo

fun cases(obj: Any) {
  when (obj) {
    1 -> println("One")
    "Hello" -> println("Greeting")
    is Long -> println("Long")
    !is String -> println("Not a string")
    else -> println("Unknown")
  }
}

fun whenAssign(obj: Any): Any {
  val result =
      when (obj) {
        1 -> "one"
        "Hello" -> 1
        is Long -> false
        else -> 42
      }

  return result
}

fun demoWhen() {
  println("=========Demo: When=============")
  cases("Hello")
  cases(1)
  cases(0L)
  cases(MyClass())
  cases("hello")

  println(whenAssign("Hello"))
  println(whenAssign(3.4))
  println(whenAssign(1))
  println(whenAssign(MyClass()))
}

class MyClass
