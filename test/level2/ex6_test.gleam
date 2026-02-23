import level2/ex6

pub fn safe_divide_test() {
  assert ex6.safe_divide(10.0, 2.0) == Ok(5.0)
  assert ex6.safe_divide(10.0, 0.0) == Error("División por cero")
}
