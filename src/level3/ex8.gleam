import gleam/int
import gleam/list

// Ejercicio 8
// Suma de lista de enteros (3 formas)
// a) recursión pura
// b) list.fold
// c) list.map + int.sum (la más idiomática)

/// Suma de una lista de enteros usando recursión pura
pub fn sum_recursive(list: List(Int)) -> Int {
  case list {
    [] -> 0
    [head, ..list] -> {
      head + sum_recursive(list)
    }
  }
}

/// Suma de una lista de enteros usando list.fold
pub fn sum_fold(list: List(Int)) -> Int {
  list.fold(list, 0, fn(acc, x) { acc + x })
}

/// Suma de una lista de enteros usando list.map + int.sum
pub fn sum_map(list: List(Int)) {
  list.map(list, fn(x) { x }) |> int.sum
}
