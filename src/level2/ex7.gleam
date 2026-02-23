import gleam/int
import gleam/string

// Ejercicio 7
// Usuario con validación
// Define un custom type:gleamtype User {
//   User(name: String, age: Int, email: String)
// }Crea create_user(name, age, email) -> Result(User, String)
// Reglas:
// name no vacío
// age ≥ 13
// email contiene "@"

pub opaque type User {
  User(name: String, age: Int, email: String)
}

pub type UserError {
  EmptyName
  Underage
  InvalidEmail
}

/// Crea un nuevo usuario validando los campos y acumulando errores
pub fn create_user(
  name: String,
  age: Int,
  email: String,
) -> Result(User, List(UserError)) {
  let errors = []

  // Validar cada campo y acumular errores
  let errors = case validate_name(name) {
    Ok(_) -> errors
    Error(e) -> [e, ..errors]
  }
  let errors = case validate_age(age) {
    Ok(_) -> errors
    Error(e) -> [e, ..errors]
  }
  let errors = case validate_email(email) {
    Ok(_) -> errors
    Error(e) -> [e, ..errors]
  }

  case errors {
    [] -> Ok(User(name, age, email))
    _ -> Error(errors)
  }
}

/// Representa usuario como string
pub fn describe_user(user: User) -> String {
  "User(name:"
  <> user.name
  <> ", age:"
  <> int.to_string(user.age)
  <> ", email:"
  <> user.email
  <> ")"
}

fn validate_name(name: String) -> Result(String, UserError) {
  // Eliminar espacios en blanco
  let value = string.trim(name)
  case value {
    "" -> Error(EmptyName)
    _ -> Ok(value)
  }
}

fn validate_age(age: Int) -> Result(Int, UserError) {
  case age {
    a if a < 13 -> Error(Underage)
    _ -> Ok(age)
  }
}

fn validate_email(email: String) -> Result(String, UserError) {
  case string.contains(email, "@") {
    True -> Ok(email)
    False -> Error(InvalidEmail)
  }
}
