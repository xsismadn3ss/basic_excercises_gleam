/// Ejercicio 1: Saludo

/// Da un saludo dependiendo de la hora del día
pub fn greeting(hour: Int) -> String {
  case hour {
    hour if hour >= 0 && hour <= 12 -> "Buenos días"
    hour if hour >= 12 && hour <= 17 -> "Buenas tardes"
    hour if hour >= 18 && hour <= 23 -> "Buenas noches"
    _ -> "Hora invalida"
  }
}
