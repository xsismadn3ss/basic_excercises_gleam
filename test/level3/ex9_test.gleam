import level3/ex9

pub fn sum_positive_doubles_test() {
  let items = [-3, -2, -1, 0, 1, 2, 3]
  let result = ex9.sum_positive_doubles(items)
  assert result == 12
}

pub fn sum_positive_doubles_optimized_test() {
  let items = [-3, -2, -1, 0, 1, 2, 3]
  let result = ex9.sum_positive_doubles_optimized(items)
  assert result == 12
}
