package demo

val openIssues: MutableSet<String> = mutableSetOf("uniqueDescr1", "uniqueDescr2", "uniqueDescr3")

fun addIssue(uniqueDescr: String): Boolean {
  return openIssues.add(uniqueDescr)
}

fun getStatusLog(isAdded: Boolean): String {
  return if (isAdded) "registered correctly." else "marked as duplicate and rejected"
}

fun demoSet() {
  println("=========Demo: Set=============")

  val aNewIssue: String = "uniqueDescr4"
  val anIssueAlreadyIn: String = "uniqueDescr2"

  println("Issue $aNewIssue ${getStatusLog(addIssue(aNewIssue))}")
  println("Issue $anIssueAlreadyIn ${getStatusLog(addIssue(anIssueAlreadyIn))}")
}
