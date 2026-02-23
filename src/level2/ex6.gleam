//Ejercicio 6
// División segura safe_divide(a: Float, b: Float) -> Result(Float, String)
// b == 0.0 → Error("División por cero")
// sino → Ok(resultado)
// Crea una función que haga 3 divisiones seguidas usando try.

/// Realizar una división segura, devolviendo un error si 
/// se intenta dividir por cero.
pub fn safe_divide(a: Float, b: Float) -> Result(Float, String) {
  case b {
    0.0 -> Error("División por cero")
    _ -> Ok(a /. b)
  }
}
