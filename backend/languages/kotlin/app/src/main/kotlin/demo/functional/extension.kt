package demo

data class Item(val name: String, val price: Float)

data class Order(val items: Collection<Item>)

fun Order.maxPricedItemValue(): Float = this.items.maxByOrNull { it.price }?.price ?: 0F // 2

fun Order.maxPricedItemName() = this.items.maxByOrNull { it.price }?.name ?: "NO_PRODUCTS"

val Order.commaDelimitedItemNames: String
  get() = items.map { it.name }.joinToString()

fun demoExtensionFunctions() {
  println("=========Demo: Extension Functions=============")
  val order = Order(listOf(Item("Bread", 25.0F), Item("Wine", 29.0F), Item("Water", 120F)))

  println("Max priced item name: ${order.maxPricedItemName()}") // 4
  println("Max priced item value: ${order.maxPricedItemValue()}")
  println("Items: ${order.commaDelimitedItemNames}") // 5
}
