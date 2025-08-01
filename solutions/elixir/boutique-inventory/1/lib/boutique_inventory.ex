defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(inventory, (fn x -> x[:price] end))
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, fn x -> x[:price] == nil end)
  end

  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory,
      fn x ->
        Map.update(x, :name, "",
          fn s -> String.replace(s, old_word, new_word)
         end)
        end)
  end

  def increase_quantity(item, count) do
    Map.update(item, :quantity_by_size, "",
      fn sizes -> Map.new(Enum.map(sizes,
                            fn {key, value} -> {key, value + count} end)) end)
  end

  def total_quantity(item) do
    Enum.reduce(item[:quantity_by_size], 0, fn {_, v}, acc -> acc + v end)
  end
end
