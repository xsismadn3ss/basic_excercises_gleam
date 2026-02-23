import gleam/option
import level2/ex5

pub fn first_test() {
  // List con elementos
  let items = ["phone", "laptop", "keyboard"]
  let first_item = ex5.first(items)
  assert first_item == option.Some("phone")

  // List vacía
  let items = []
  let first_item = ex5.first(items)
  assert first_item == option.None
}

pub fn first_or_test() {
  // List con elementos
  let items = ["phone", "laptop", "keyboard"]
  let first_item = ex5.first_or(items, "sin resultados")
  assert first_item == "phone"

  // List vacía
  let items = []
  let first_item = ex5.first_or(items, "sin resultados")
  assert first_item == "sin resultados"
}
