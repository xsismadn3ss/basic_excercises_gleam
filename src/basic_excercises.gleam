import gleam/io
import level1/ex1
import level1/ex2
import utils/time

pub fn main() -> Nil {
  io.println("Ejercicio 1")
  let now = time.now(-6)
  echo "Hora actual: " <> time.to_string(now)
  echo now.hour |> ex1.greeting

  io.println("\nEjercicio 2")
  ex2.preview()
  Nil
}
