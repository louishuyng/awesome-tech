package demo

import kotlin.text.toUpperCase

fun demoStringTemplate() {
  println("=========Demo: String Template=============")

  val greeting = "Kotliner"

  println("Hello $greeting")
  println("Hello ${greeting.toUpperCase()}")
}
