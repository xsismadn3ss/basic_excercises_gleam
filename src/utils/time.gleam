import gleam/float
import gleam/int
import gleam/time/timestamp

/// Tipo para representar tiempo
pub type Time {
  Time(hour: Int, minute: Int, second: Int, millisecond: Int)
}

/// Devuelve el tiempo actual del sistema
pub fn now(offset: Int) -> Time {
  let now = timestamp.system_time()
  let total_seconds = timestamp.to_unix_seconds(now)

  Time(
    // Ajuste de zona horaria
    hour: convert_unix_to_hours(total_seconds) + offset,
    minute: convert_unix_to_minutes(total_seconds),
    second: convert_unix_to_seconds(total_seconds),
    millisecond: convert_unix_to_millis(total_seconds),
  )
}

pub fn to_string(time: Time) -> String {
  int.to_string(time.hour)
  <> ":"
  <> int.to_string(time.minute)
  <> ":"
  <> int.to_string(time.second)
  <> "."
  <> int.to_string(time.millisecond)
}

fn convert_unix_to_millis(unix_seconds: Float) -> Int {
  round_unix_seconds(unix_seconds *. 1000.0) % 1000
}

fn convert_unix_to_seconds(unix_seconds: Float) -> Int {
  round_unix_seconds(unix_seconds) % 60
}

fn convert_unix_to_minutes(unix_seconds: Float) -> Int {
  { round_unix_seconds(unix_seconds) / 60 } % 60
}

fn convert_unix_to_hours(unix_seconds: Float) -> Int {
  { round_unix_seconds(unix_seconds) / 3600 } % 24
}

fn round_unix_seconds(unix_seconds: Float) -> Int {
  unix_seconds |> float.round
}
