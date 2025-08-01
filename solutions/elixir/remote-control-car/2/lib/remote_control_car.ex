defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [:nickname,
             battery_percentage: 100,
             distance_driven_in_meters: 0,
            ]

  def new(nickname \\ "none") do
    %RemoteControlCar{nickname: nickname}
  end

  def display_distance(%RemoteControlCar{distance_driven_in_meters: distance}) do
    "#{distance} meters"
  end

  def display_battery(%RemoteControlCar{battery_percentage: percentage}) do
    if percentage === 0, do: "Battery empty",
      else: "Battery at #{percentage}%"
  end

  def drive(%RemoteControlCar{battery_percentage: 0} = car), do: car
  def drive(%RemoteControlCar{} = car) do
    %{car |
      distance_driven_in_meters: car.distance_driven_in_meters + 20,
      battery_percentage: car.battery_percentage - 1}
  end
end
