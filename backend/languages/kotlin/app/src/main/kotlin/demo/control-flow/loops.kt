package demo

class Animal(val name: String)

class Zoo(val animals: List<Animal>) {
  operator fun iterator(): Iterator<Animal> {
    return animals.iterator()
  }
}

fun eatACake() = println("Eat a Cake")

fun bakeACake() = println("Bake a Cake")

fun demoLoops() {
  var cakesEaten = 0
  var cakesBaked = 0

  println("=========Demo: Loops=============")

  // For
  val cakes = listOf("carrot", "cheese", "chocolate")

  for (cake in cakes) {
    println("Yummy, it's a $cake cake!")
  }

  // While
  while (cakesEaten < 5) {
    eatACake()
    cakesEaten++
  }

  do {
    bakeACake()
    cakesBaked++
  } while (cakesBaked < cakesEaten)

  // Iterators
  val zoo = Zoo(listOf(Animal("zebra"), Animal("lion")))

  for (animal in zoo) {
    println("Watch out, it's a ${animal.name}")
  }
}
