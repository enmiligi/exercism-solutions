# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start(opts \\ []) do
    Agent.start(fn -> {1, []} end, opts)
  end

  def list_registrations(pid) do
    Agent.get(pid, fn {_id, list} -> list end)
  end

  def register(pid, register_to) do
    Agent.get_and_update(pid,
      fn {id, list} ->
        plot = %Plot{plot_id: id, registered_to: register_to}
        {plot, {id + 1, [plot | list]}} end)
  end

  def release(pid, plot_id) do
    Agent.update(pid,
      fn {id, list} ->
        {id, Enum.reject(list,
          &(&1.plot_id == plot_id))
         } end)
  end

  def get_registration(pid, plot_id) do
    Agent.get(pid, fn {_, list} ->
      Enum.find(list, {:not_found, "plot is unregistered"},
      &(&1.plot_id === plot_id)) end)
  end
end
