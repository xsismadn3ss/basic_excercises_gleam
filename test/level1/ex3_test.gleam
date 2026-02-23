import level1/ex3

pub fn duplicate_str_test() {
  let text = "hola"
  let times = 3
  let result = ex3.duplicate_str(text, times)

  assert result == "holaholahola"
}

pub fn duplicate_str_zero_times_test() {
  let text = "hola"
  let times = 0
  let result = ex3.duplicate_str(text, times)

  assert result == ""
}

pub fn duplicate_str_negative_times_test() {
  let text = "hola"
  let times = -1
  let result = ex3.duplicate_str(text, times)

  assert result == "Error: El numero de veces debe ser un entero positivo"
}
