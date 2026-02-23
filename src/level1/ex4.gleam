import gleam/list
import gleam/string

//Contar vocalescount_vowels(text: String) -> Int
// Intenta primero con recursión sobre los caracteres, luego con string.to_graphemes + list.fold.

const vowels = ["a", "e", "i", "o", "u"]

/// Contar vocales usando recursión sobre los caracteres
pub fn count_vowels_recursive(text: String) -> Int {
  case text {
    "" -> 0
    _ -> {
      let first_char = string.first(text)
      let rest = string.slice(text, 1, string.length(text))
      let count_for_first = {
        case first_char {
          Ok(char) ->
            case is_vowel(char) {
              True -> 1
              False -> 0
            }
          Error(_) -> 0
        }
      }
      count_for_first + count_vowels_recursive(rest)
    }
  }
}

// usando string.to_graphemes + list.fold
/// Contar vocales usando string.to_graphemes + list.fold
pub fn count_vowels_fold(text: String) -> Int {
  let graphemes = string.to_graphemes(text)

  list.fold(graphemes, 0, fn(count, char) {
    case is_vowel(char) {
      True -> count + 1
      False -> count
    }
  })
}

fn is_vowel(char: String) -> Bool {
  vowels |> list.contains(char)
}
