defmodule BoutiqueSuggestions do
  def get_combinations(tops, bottoms, options \\ []) do
    max_price = if options[:maximum_price], do: options[:maximum_price], else: 100
    for top <- tops, bottom <- bottoms,
        top.base_color != bottom.base_color,
        top.price + bottom.price <= max_price,
        do: {top, bottom}
  end
end
