defmodule Lasagna do
  def expected_minutes_in_oven() do
    40
  end

  def remaining_minutes_in_oven(minutes_passed) do
    expected_minutes_in_oven() - minutes_passed
  end

  def preparation_time_in_minutes(layers) do
    layers * 2
  end

  def total_time_in_minutes(layers, minutes_passed) do
    preparation_time_in_minutes(layers) + minutes_passed
  end

  def alarm() do
    "Ding!"
  end
end
