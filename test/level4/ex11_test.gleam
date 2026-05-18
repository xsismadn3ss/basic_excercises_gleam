import level4/ex11.{Add, Divide, Multiply, Power, Substract, calculate, power}

pub fn add_test() {
  assert calculate(2.0, 3.0, Add) == 5.0
}

pub fn substract_test() {
  assert calculate(10.0, 3.0, Substract) == 7.0
}

pub fn multiply_test() {
  assert calculate(2.0, 2.0, Multiply) == 4.0
}

pub fn divide_test() {
  assert calculate(10.0, 2.0, Divide) == 5.0
}

pub fn power_test() {
  assert calculate(-2.0, 3.0, Power) == -8.0
  assert power(base: -2.0, exponent: 3.0) == -8.0
}
