package demo

data class PersonApply(var name: String, var age: Int, var about: String) {
  constructor() : this("", 0, "")
}

fun demoApply() {
  println("=========Demo: Apply=============")

  val jake = PersonApply()

  val stringDescription =
      jake
          .apply {
            name = "Jake"
            age = 30
            about = "Android developer"
          }
          .toString()

  println(stringDescription)
}
