import gleam/list
import gleam/result
import level2/ex7

pub fn wrong_user_test() {
  // Nombre vacio
  let result = ex7.create_user("", 21, "shiro@example.com")
  assert result == Error([ex7.EmptyName])

  // Edad menor a 13
  let result = ex7.create_user("Shiro", 10, "shiro@example.com")
  assert result == Error([ex7.Underage])

  // Email sin '@'
  let result = ex7.create_user("Shiro", 21, "shiroexample.com")
  assert result == Error([ex7.InvalidEmail])

  // Todos los errores juntos
  let result = ex7.create_user("", 10, "shiroexample.com")

  // Se invierte la lista de errores porque en gleam cuando se agrega un valor
  // a una lista se agrega al inicio, lo cual genera una lista de errores en 
  // orden inverso al esperado
  assert result
    == Error([ex7.EmptyName, ex7.Underage, ex7.InvalidEmail] |> list.reverse)
}

pub fn correct_user_test() {
  let result = ex7.create_user("Shiro", 21, "shiro@example.com")
  let described_result = result |> result.map(ex7.describe_user)

  assert described_result
    == Ok("User(name:Shiro, age:21, email:shiro@example.com)")
}
