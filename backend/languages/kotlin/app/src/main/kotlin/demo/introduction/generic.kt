package demo

class MutalbeStack<E>(vararg items: E) {
  private val elements = items.toMutableList()

  fun push(element: E) = elements.add(element)

  fun peek() = elements.last()

  fun pop(): E = elements.removeAt(elements.size - 1)

  fun isEmpty() = elements.isEmpty()

  fun size() = elements.size

  override fun toString() = "MutalbeStack(${elements.joinToString()})"
}

fun <E> mutableStackOf(vararg elements: E) = MutalbeStack(*elements)

fun demoGeneric() {
  println("=========Demo: Generic=============")
  val stack = mutableStackOf(0.62, 3.14, 2.7)
  println(stack)
}
