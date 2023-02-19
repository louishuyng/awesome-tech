package demo

fun format(userName: String, domain: String) = "$userName@$domain"

fun demoNamedArguments() {
  println("=========Demo: Named Arguments=============")

  println(format("margio", "example.com"))
  println(format("domain.com", "username"))
  println(format(userName = "foo", domain = "bar.com"))
  println(format(domain = "frog.com", userName = "pepe"))
}
