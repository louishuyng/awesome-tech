package demo

class Configuration(var host: String, var port: Int)

fun demoWith() {
  println("=========Demo: With=============")

  val configuration = Configuration(host = "127.0.0.1", port = 9000)

  with(configuration) { println("$host:$port") }

  // instead of:
  // println("${configuration.host}:${configuration.port}")
}
