import level3/ex10

pub fn zero_celsius_to_kelvin_test() {
  let temp = ex10.Temperature(0.0, ex10.Celsius)
  let conversion = ex10.to_kelvin(temp)

  assert conversion.value == 273.15
}

pub fn kelvin_to_celsius_test() {
  let temp = ex10.Temperature(273.15, ex10.Kelvin)
  let conversion = ex10.to_celsius(temp)

  assert conversion.value == 0.0
}
