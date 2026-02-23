// Ejercicio 3:
// Duplicar un string n vecesduplicate(text: String, times: Int) -> String
// Usa recursión (sin string.repeat al principio).

pub fn duplicate_str(text: String, times: Int) -> String {
  case times {
    times if times < 0 ->
      "Error: El numero de veces debe ser un entero positivo"
    times if times == 0 -> ""
    _ -> {
      text <> duplicate_str(text, times - 1)
    }
  }
}

pub fn preview() {
  echo duplicate_str("hola", 3)
  echo duplicate_str("gleam", 2)
  echo duplicate_str("test", 0)
  echo duplicate_str("error", -1)
}
