// Ejercicio 2
// Es par o impar – con Result
// is_even(n: Int) -> Result(Bool, String)
// Si n < 0 → Error("Número negativo no permitido")
// Sino → Ok(par o impar)
// Luego crea describe_even(n) que use result.map o case.

/// Validar si un nuemero es par o impar, pero si el número es negativo, retornar un error.
pub fn is_even(n: Int) -> Result(Bool, String) {
  case n {
    n if n < 0 -> Error("Número negativo no permitido")
    n if n % 2 == 0 -> Ok(True)
    _ -> Ok(False)
  }
}

/// Describir si un número es par o impar, usando el resultado de is_even.
pub fn describe_even(n: Int) -> String {
  case is_even(n) {
    Ok(True) -> "Es par"
    Ok(False) -> "Es impar"
    Error(msg) -> "Error: " <> msg
  }
}

pub fn preview() -> Nil {
  // "Es par"
  echo describe_even(4)
  // "Es impar"
  echo describe_even(7)
  // "Error: Número negativo no permitido"
  echo describe_even(-3)
  Nil
}
