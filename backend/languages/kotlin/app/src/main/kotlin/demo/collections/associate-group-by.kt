package demo

class Person(val name: String, val city: String, val phone: String)

val people =
    listOf( // 2
        Person("John", "Boston", "+1-888-123456"),
        Person("Sarah", "Munich", "+49-777-789123"),
        Person("Svyatoslav", "Saint-Petersburg", "+7-999-456789"),
        Person("Vasilisa", "Saint-Petersburg", "+7-999-123456")
    )

fun demoAssociateGroupBy() {
  println("=========Demo: Associate and Group By=============")
  val phoneBook = people.associateBy { it.phone }
  val cityBook = people.associateBy(Person::phone, Person::city)
  val peopleCities = people.groupBy(Person::city, Person::name)
  val lastPersonCity = people.associateBy(Person::city, Person::name)

  println("Phone Book: $phoneBook")
  println("City Book: $cityBook")
  println("People Cities: $peopleCities")
  println("Last Person Cities: $lastPersonCity")
}
