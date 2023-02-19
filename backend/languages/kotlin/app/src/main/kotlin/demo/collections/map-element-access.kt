package demo

fun demoMapElementAccess() {
  println("=========Demo: Map Element Access=============")

  val map = mapOf("key" to 42)

  val value1 = map["key"]
  val value2 = map["key2"]

  val value3: Int = map.getValue("key")

  val mapWithDefault = map.withDefault { k -> k.length }
  val value4 = mapWithDefault.getValue("keyyyy") // Length is 6

  println("Value 1 $value1")
  println("Value 2 $value2")
  println("Value 3 $value3")
  println("Map With Default $mapWithDefault")
  println("Value 4 $value4")
}
