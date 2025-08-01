defmodule Username do
  @spec sanitize(charlist())  :: charlist()
  def sanitize([]), do: ''
  def sanitize([h | t]) do
    case h do
      c when c >= ?a and c <= ?z -> [c | sanitize(t)]
      ?_ ->
        [h | sanitize(t)]
      ?ä -> 'ae' ++ sanitize(t)
      ?ö -> 'oe' ++ sanitize(t)
      ?ü -> 'ue' ++ sanitize(t)
      ?ß -> 'ss' ++ sanitize(t)
      _ -> sanitize(t)
    end
  end
end
