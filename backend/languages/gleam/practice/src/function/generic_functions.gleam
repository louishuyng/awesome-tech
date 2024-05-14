import gleam/io

pub fn main() {
  let exclaim = fn(x) { x <> "!" }
  let add_one = fn(x) { x + 1 }

  io.debug(twice(1, add_one))
  io.debug(twice("Hello", exclaim))
}

fn twice(argument: value, passed_function: fn(value) -> value) -> value {
  passed_function(passed_function(argument))
}
