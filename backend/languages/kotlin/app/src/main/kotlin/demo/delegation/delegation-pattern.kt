package demo

interface SoundBehavior {
  fun makeSound()
}

class ScreamBehavior(val n: String) : SoundBehavior {
  override fun makeSound() = println("${n.uppercase()} !!!")
}

class RockAndRollBehavior(val n: String) : SoundBehavior {
  override fun makeSound() = println("I'm The King of Rock 'N' Roll: $n")
}

class TomAraya(n: String) : SoundBehavior by ScreamBehavior(n)

class ElvisPresely(n: String) : SoundBehavior by RockAndRollBehavior(n)

fun demoDelegationPattern() {
  println("=========Demo: Delegation Pattern=============")

  val tomAraya = TomAraya("Thrash Meta")
  tomAraya.makeSound()

  val elvisPresely = ElvisPresely("Dancin' to the Jalihouse Rock.")
  elvisPresely.makeSound()
}
