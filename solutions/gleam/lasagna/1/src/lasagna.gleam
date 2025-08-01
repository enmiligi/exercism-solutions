// Please define the expected_minutes_in_oven function
pub fn expected_minutes_in_oven() -> Int {
  40
}

pub fn remaining_minutes_in_oven(minutes_passed) {
  expected_minutes_in_oven() - minutes_passed
}

pub fn preparation_time_in_minutes(layers) {
  layers * 2
}

pub fn total_time_in_minutes(layers, minutes_passed) {
  minutes_passed + preparation_time_in_minutes(layers)
}

pub fn alarm() {
  "Ding!"
}
