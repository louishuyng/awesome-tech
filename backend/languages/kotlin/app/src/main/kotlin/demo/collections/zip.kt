package demo

fun demoZip() {
  println("=========Demo: Zip=============")

  val A = listOf("a", "b", "c")
  val B = listOf(1, 2, 3, 4)

  val resultPairs = A zip B
  val resultReduce = A.zip(B) { a, b -> "$a$b" }
  println("Result Pairs: $resultPairs")
  println("Result Reduce: $resultReduce")
}
