defmodule CaptainsLog do
  @planetary_classes ["D", "H", "J", "K", "L", "M", "N", "R", "T", "Y"]

  def random_planet_class() do
    Enum.random(@planetary_classes)
  end

  def random_ship_registry_number() do
    id = :rand.uniform(8999) + 1000
    "NCC-#{id}"
  end

  def random_stardate() do
    :rand.uniform() * 1000 + 41000
  end

  def format_stardate(stardate) do
    to_string(:io_lib.format("~.1f", [stardate]))
  end
end
