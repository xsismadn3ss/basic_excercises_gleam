//// Ejercicio 9
//// Filtro + transformación con pipe
//// Dada una List(Int)
//// filtra solo positivos
//// multiplica × 2
//// suma todo
//// Hazlo en una sola expresión usando |> varias veces.

import gleam/int
import gleam/list

/// Sumar el doble de todos los numero positivos de una lista
pub fn sum_positive_doubles(nums: List(Int)) -> Int {
  nums
  |> list.filter(fn(x) { x > 0 })
  |> list.map(fn(x) { x * 2 })
  |> int.sum
}

pub fn sum_positive_doubles_optimized(nums: List(Int)) -> Int {
  nums
  |> list.fold(0, fn(acc, x) {
    case x {
      x if x > 0 -> acc + { x * 2 }
      _ -> acc
    }
  })
}
