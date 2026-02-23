import level1/ex2

pub fn es_par_test() {
  assert ex2.is_even(4) == Ok(True)
}

pub fn es_impar_test() {
  assert ex2.is_even(7) == Ok(False)
}

pub fn numero_negativo_test() {
  assert ex2.is_even(-3) == Error("Número negativo no permitido")
}

pub fn describe_par_test() {
  assert ex2.describe_even(4) == "Es par"
  assert ex2.describe_even(7) == "Es impar"
  assert ex2.describe_even(-3) == "Error: Número negativo no permitido"
}
