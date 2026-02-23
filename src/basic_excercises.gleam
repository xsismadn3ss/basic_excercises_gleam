import gleam/io
import level1/ex1
import utils/time

pub fn main() -> Nil {
  echo "Ejecricio 1"
  let now = time.now(-6)
  io.println("Hora actual: " <> time.to_string(now))
  io.println(now.hour |> ex1.greeting)
}
