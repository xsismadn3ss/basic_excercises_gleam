import level1/ex1.{greeting}

pub fn morning_greeting_test() {
  let hour = 9
  let result = greeting(hour)
  assert result == "Buenos días"
}

pub fn afternoon_greeting_test() {
  let hour = 15
  let result = greeting(hour)
  assert result == "Buenas tardes"
}

pub fn evening_greeting_test() {
  let hour = 20
  let result = greeting(hour)
  assert result == "Buenas noches"
}

pub fn invalid_hour_greeting_test() {
  let hour = 25
  let result = greeting(hour)
  assert result == "Hora invalida"
}
