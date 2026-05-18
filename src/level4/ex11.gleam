//// Ejercicio 11: Calculadora simple

/// Conjunto de operaciones matemáticas básicas
pub type Operation {
  // Suma
  Add
  // Resta
  Substract
  // Multiplicación
  Multiply
  // División
  Divide
  // Potenciación
  Power
}

pub fn calculate(a: Float, b: Float, operation: Operation) -> Float {
  case operation {
    Add -> a +. b
    Substract -> a -. b
    Multiply -> a *. b
    Divide -> a /. b
    Power -> do_power(base: a, exponent: b, acc: 1.0)
  }
}

pub fn power(base base: Float, exponent exponent: Float) {
  do_power(base, exponent, 1.0)
}

/// Calcular potencia 
fn do_power(base base: Float, exponent exponent: Float, acc acc: Float) -> Float {
  case exponent >. 0.0 {
    False -> acc
    True -> do_power(base, exponent -. 1.0, acc *. base)
  }
}
