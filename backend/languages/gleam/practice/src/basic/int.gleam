import gleam/int
import gleam/io

pub fn main() {
  io.debug(2 + 1)

  io.debug(int.max(42, 77))
}
