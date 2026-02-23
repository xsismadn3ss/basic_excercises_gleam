import level3/ex8

const list_example = [1, 2, 3, 4, 5]

pub fn sum_recursive_test() {
  let result = ex8.sum_recursive(list_example)
  assert result == 15
}

pub fn sum_fold_test() {
  let result = ex8.sum_fold(list_example)
  assert result == 15
}

pub fn sum_map_test() {
  let result = ex8.sum_map(list_example)
  assert result == 15
}

pub fn sum_empty_list_test() {
  let empty_list: List(Int) = []
  assert ex8.sum_recursive(empty_list) == 0
  assert ex8.sum_fold(empty_list) == 0
  assert ex8.sum_map(empty_list) == 0
}
