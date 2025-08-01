defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    elem(volume_pair, 1)
  end

  def to_milliliter({:cup, volume}), do: {:milliliter, volume * 240}
  def to_milliliter({:fluid_ounce, volume}), do: {:milliliter, volume * 30}
  def to_milliliter({:teaspoon, volume}), do: {:milliliter, volume * 5}
  def to_milliliter({:tablespoon, volume}), do: {:milliliter, volume * 15}
  def to_milliliter({:milliliter, _volume} = volume_pair), do: volume_pair

  def from_milliliter({:milliliter, volume}, :cup), do: {:cup, volume / 240}
  def from_milliliter({:milliliter, volume}, :fluid_ounce), do: {:fluid_ounce, volume / 30}
  def from_milliliter({:milliliter, volume}, :teaspoon), do: {:teaspoon, volume / 5}
  def from_milliliter({:milliliter, volume}, :tablespoon), do: {:tablespoon, volume / 15}
  def from_milliliter({:milliliter, _volume} = volume_pair, :milliliter), do: volume_pair

  def convert(volume_pair, unit), do: from_milliliter(to_milliliter(volume_pair), unit)
end
