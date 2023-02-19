package demo

const val POINT_X_PASS: Int = 15

val EZPassAccounts: MutableMap<Int, Int> = mutableMapOf(1 to 100, 2 to 100, 3 to 100)
val EZPassReport: Map<Int, Int> = EZPassAccounts

fun updatePoints(accountId: Int) {
  if (EZPassAccounts.containsKey(accountId)) {
    println("Updating $accountId...")
    EZPassAccounts[accountId] = EZPassAccounts.getValue(accountId) + POINT_X_PASS
  } else {
    println("Error: Trying to update a non-existing account (id: $accountId)")
  }
}

fun accountsReport() {
  println("EZ-Pass report:")
  EZPassReport.forEach { k, v -> println("ID $k: credit $v") }
}

fun demoMap() {
  println("=========Demo: Map=============")
  updatePoints(1)
  updatePoints(1)
  updatePoints(5)
  accountsReport()
}
