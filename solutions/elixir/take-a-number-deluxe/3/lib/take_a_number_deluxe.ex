defmodule TakeANumberDeluxe do
  # Client API

  @spec start_link(keyword()) :: {:ok, pid()} | {:error, atom()}
  def start_link(init_arg) do
    GenServer.start_link(__MODULE__, init_arg)
  end

  @spec report_state(pid()) :: TakeANumberDeluxe.State.t()
  def report_state(machine) do
    GenServer.call(machine, :report)
  end

  @spec queue_new_number(pid()) :: {:ok, integer()} | {:error, atom()}
  def queue_new_number(machine) do
    GenServer.call(machine, :queue)
  end

  @spec serve_next_queued_number(pid(), integer() | nil) :: {:ok, integer()} | {:error, atom()}
  def serve_next_queued_number(machine, priority_number \\ nil) do
    GenServer.call(machine, {:serve, priority_number})
  end

  @spec reset_state(pid()) :: :ok
  def reset_state(machine) do
    GenServer.cast(machine, :reset)
  end

  # Server callbacks
  use GenServer

  @impl GenServer
  def init(init_arg) do
    min = Keyword.get(init_arg, :min_number)
    max = Keyword.get(init_arg, :max_number)
    timeout = Keyword.get(init_arg, :auto_shutdown_timeout, :infinity)
    case TakeANumberDeluxe.State.new(min, max, timeout) do
      {:ok, state} -> {:ok, state, timeout}
      {:error, error} -> {:stop, error}
    end
  end

  @impl GenServer
  def handle_call(message, _from, state) do
    timeout = state.auto_shutdown_timeout
    case message do
      :report -> {:reply, state, state, timeout}
      :queue ->
        case TakeANumberDeluxe.State.queue_new_number(state) do
          {:ok, new_number, new_state} -> {:reply, {:ok, new_number}, new_state, timeout}
          {:error, error} -> {:reply, {:error, error}, state, timeout}
        end
      {:serve, priority_number} ->
        case TakeANumberDeluxe.State.serve_next_queued_number(state, priority_number) do
          {:ok, next_number, new_state} -> {:reply, {:ok, next_number}, new_state, timeout}
          {:error, error} -> {:reply, {:error, error}, state, timeout}
        end
    end
  end

  @impl GenServer
  def handle_cast(message, state) do
    timeout = state.auto_shutdown_timeout
    case message do
      :reset ->
        {:ok, new_state} = TakeANumberDeluxe.State.new(
          state.min_number,
          state.max_number,
          timeout)
        {:noreply, new_state, timeout}
    end
  end

  @impl GenServer
  def handle_info(message, state) do
    timeout = state.auto_shutdown_timeout
    case message do
      :timeout ->
        {:stop, :normal, state}
      _ -> {:noreply, state, timeout}
    end
  end
end
