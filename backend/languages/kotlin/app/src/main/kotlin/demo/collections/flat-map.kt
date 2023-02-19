package demo

fun demoFlat() {
  println("=========Demo: Flat=============")

  val fruitsBag = listOf("apple", "orange", "banana", "grapes")
  val clothesBag = listOf("shirts", "pants", "jeans")

  val cart = listOf(fruitsBag, clothesBag)

  val mapBag = cart.map { it }
  val flatMpaBag = cart.flatMap { it }

  println("Map Bag: $mapBag")
  println("Flat Bag: $flatMpaBag")
}
