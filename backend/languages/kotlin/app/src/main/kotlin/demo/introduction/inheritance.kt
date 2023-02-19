package demo

open class Dog {
  open fun sayHello() {
    println("wow wow!")
  }
}

class Yorkshire : Dog() {
  override fun sayHello() {
    println("wif wif!")
  }
}

fun demoInheritance() {
  println("=========Demo: Inheritance=============")
  val dog: Dog = Yorkshire()
  dog.sayHello()
}
