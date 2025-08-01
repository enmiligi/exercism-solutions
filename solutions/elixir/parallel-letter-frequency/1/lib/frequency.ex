defmodule Frequency do
  @doc """
  Count letter frequency in parallel.

  Returns a map of characters to frequencies.

  The number of worker processes to use can be set with 'workers'.
  """
  @spec frequency([String.t()], pos_integer) :: map
  def frequency(texts, workers) do
    {:ok, pid} = Task.Supervisor.start_link()
    partitions = Enum.chunk_every(texts, max(1, Integer.floor_div(length(texts), workers)))

    partitions
    |> Enum.map(fn partition ->
      Task.Supervisor.async(pid, fn ->
        partition
        |> Enum.join()
        |> String.downcase()
        |> String.graphemes()
        |> Enum.filter(&String.match?(&1, ~r/[[:alpha:]]/))
        |> Enum.reduce(%{}, fn c, acc ->
          case acc do
            %{^c => count} ->
              %{acc | c => count + 1}

            %{} ->
              Map.put(acc, c, 1)
          end
        end)
      end)
    end)
    |> Task.await_many()
    |> Enum.reduce(%{}, fn map, acc ->
      Enum.reduce(map, acc, fn {key, c1}, map ->
        case map do
          %{^key => c2} ->
            %{map | key => c1 + c2}

          %{} ->
            Map.put(map, key, c1)
        end
      end)
    end)
  end
end
