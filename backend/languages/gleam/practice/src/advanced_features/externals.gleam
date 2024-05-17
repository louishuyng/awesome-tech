import gleam/io

// A type with no Gleam constructors
pub type DateTime

// An external function that creates an instance of the type
// pub fn now() -> DateTime

@external(javascript, "./my_package_ffi.mjs", "now")
pub fn main() {
  todo
  // io.debug(now())
}
