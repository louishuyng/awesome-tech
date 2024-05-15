import gleam/int
import gleam/io

pub fn main() {
  let money = int.random(10)

  case buy_pastry(money) {
    Ok(money) ->
      io.debug(
        "You bought a pastry! You have " <> int.to_string(money) <> " left.",
      )
    Error(NotEnoughMoney(required)) ->
      io.debug(
        "You need at least " <> int.to_string(required) <> " to buy a pastry.",
      )
    Error(NotLuckyEnough) -> io.debug("You didn't get a pastry this time.")
  }
}

pub type PurchaseError {
  NotEnoughMoney(required: Int)
  NotLuckyEnough
}

fn buy_pastry(money: Int) -> Result(Int, PurchaseError) {
  case money >= 5 {
    True ->
      case int.random(4) == 0 {
        True -> Error(NotLuckyEnough)
        False -> Ok(money - 5)
      }
    False -> Error(NotEnoughMoney(required: 5))
  }
}
