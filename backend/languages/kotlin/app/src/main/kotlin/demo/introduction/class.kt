package demo

class Customer

class Contract(val id: Int, var email: String)

fun demoClass() {
  println("=========Demo: Class=============")
  val contract = Contract(1, "test")

  println(contract.id)
  contract.email = "huynguyennbk@Gmail.com"

  println(contract.email)
}
