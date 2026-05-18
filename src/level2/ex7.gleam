import gleam/int
import gleam/list
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

/// Representa un usuario con validación de campos
pub opaque type User {
  User(name: String, age: Int, email: String)
}

/// Errores posibles al crear un usuario
pub type UserError {
  /// Nombre vacío
  EmptyName
  /// Edad menor a 13
  Underage
  /// Email no válido
  InvalidEmail
}

/// Crea un nuevo usuario validando los campos,
/// retorna un listado de errores si alguno no es válido
pub fn create_user(
  name: String,
  age: Int,
  email: String,
) -> Result(User, List(UserError)) {
  let validation_results = [
    validate_name(name),
    validate_age(age),
    validate_email(email),
  ]

  let errors =
    list.fold(validation_results, [], fn(acc, result) {
      case result {
        Ok(_) -> acc
        Error(e) -> [e, ..acc]
      }
    })
    |> list.reverse

  case errors {
    [] -> Ok(User(name, age, email))
    _ -> Error(errors)
  }
}

/// Representar usuario como string
pub fn describe_user(user: User) -> String {
  "User(name:"
  <> user.name
  <> ", age:"
  <> int.to_string(user.age)
  <> ", email:"
  <> user.email
  <> ")"
}

type ValidatedValue {
  IntValue(value: Int)
  StringValue(value: String)
}

fn validate_name(name: String) -> Result(ValidatedValue, UserError) {
  // Eliminar espacios en blanco
  let value = string.trim(name)
  case value {
    "" -> Error(EmptyName)
    _ -> Ok(StringValue(value))
  }
}

fn validate_age(age: Int) -> Result(ValidatedValue, UserError) {
  case age {
    a if a < 13 -> Error(Underage)
    _ -> Ok(IntValue(age))
  }
}

fn validate_email(email: String) -> Result(ValidatedValue, UserError) {
  case string.contains(email, "@") {
    True -> Ok(StringValue(email))
    False -> Error(InvalidEmail)
  }
}
