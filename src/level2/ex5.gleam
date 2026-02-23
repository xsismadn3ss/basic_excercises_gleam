import gleam/option.{type Option, None, Some}

// Ejercicio 5
// Primer elemento de lista (safe head)first(list: List(a)) -> Option(a)
// Luego crea first_or(list, default) que devuelva el valor o el default.

/// Obtener el primer elemento de una lista de forma segura, 
/// devolviendo None si la lista está vacía.
pub fn first(list: List(a)) -> Option(a) {
  case list {
    [] -> None
    [head, ..] -> Some(head)
  }
}

/// Obtener el primer elemento de una lista o un valor por 
/// defecto si la lista está vacía.
pub fn first_or(list: List(a), default: a) -> a {
  let first_element = first(list)
  option.unwrap(first_element, default)
}
