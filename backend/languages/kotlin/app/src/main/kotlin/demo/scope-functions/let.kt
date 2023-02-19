package demo

fun customPrint(s: String) {
  print(s.uppercase())
}

fun printNonNull(str: String?) {
  println("Printing \"$str\":")

  str?.let {
    print("\t")
    customPrint(it)
    println()
  }
}

fun printIfBothNonNull(strOne: String?, strTwo: String?) {
  strOne?.let { firstString ->
    strTwo.let { secondString ->
      customPrint("$firstString : $secondString")
      println()
    }
  }
}

fun demoLet() {
  println("=========Demo: Let=============")

  val empty =
      "test".let {
        customPrint(it)
        it.isEmpty()
      }

  println(" is empty: $empty")
  printNonNull(null)
  printNonNull("my string")
  printIfBothNonNull("First", "Second")
  printIfBothNonNull(null, "Second")
}
