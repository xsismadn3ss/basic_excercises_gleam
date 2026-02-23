import level1/ex4

pub fn count_vowels_recursive_test() {
  let count = ex4.count_vowels_recursive("aeiou")
  assert count == 5

  let count = ex4.count_vowels_recursive("e")
  assert count == 1
}

pub fn count_vowels_fold_test() {
  let count = ex4.count_vowels_fold("aeiou")
  assert count == 5

  let count = ex4.count_vowels_fold("test")
  assert count == 1
}
