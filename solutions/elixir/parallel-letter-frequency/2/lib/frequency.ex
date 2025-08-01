defmodule Frequency do
  @doc """
  Count letter frequency in parallel.

  Returns a map of characters to frequencies.

  The number of worker processes to use can be set with 'workers'.
  """
  @spec frequency([String.t()], pos_integer) :: map
  def frequency(texts, workers) do
    texts
    |> Task.async_stream(
      fn text ->
        text
        |> String.downcase()
        |> String.graphemes()
        |> Enum.filter(&String.match?(&1, ~r/[[:alpha:]]/))
        |> Enum.reduce(
          %{},
          fn c, acc ->
            case acc do
              %{^c => count} ->
                %{acc | c => count + 1}

              %{} ->
                Map.put(acc, c, 1)
            end
          end
        )
      end,
      max_concurrency: workers
    )
    |> Enum.reduce(%{}, fn {:ok, map}, acc ->
      Map.merge(map, acc, fn _, c1, c2 ->
        c1 + c2
      end)
    end)
  end
end
