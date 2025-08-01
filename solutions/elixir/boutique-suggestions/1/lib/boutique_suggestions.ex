defmodule BoutiqueSuggestions do
  def get_combinations(tops, bottoms, options \\ []) do
    max_price = if options[:maximum_price], do: options[:maximum_price], else: 100
    for %{base_color: b_c1, price: p1, item_name: n1, color: c1} <- tops,
        %{base_color: b_c2, price: p2, item_name: n2, color: c2} <- bottoms,
        b_c1 != b_c2,
        p1 + p2 <= max_price,
        do: {%{base_color: b_c1, price: p1, item_name: n1, color: c1},
             %{base_color: b_c2, price: p2, item_name: n2, color: c2}}
  end
end
