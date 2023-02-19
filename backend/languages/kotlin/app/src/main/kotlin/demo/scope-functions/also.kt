package demo

data class PersonAlso(var name: String, var age: Int, var about: String) {
  constructor() : this("", 0, "")
}

fun writeCreationLog(p: PersonAlso) {
  println("A new person ${p.name} was created")
}

fun demoAlso() {
  println("=========Demo: Also=============")

  val jake = PersonAlso("Jake", 30, "AndroidDeveloper").also { writeCreationLog(it) }
}
