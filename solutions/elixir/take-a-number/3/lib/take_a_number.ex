defmodule TakeANumber do
  def start() do
    spawn(&process/0)
  end

  defp process(ticket_number \\ 0) do
    receive do
      {:report_state, sender_pid} ->
        send(sender_pid, ticket_number) |> process()
      {:take_a_number, sender_pid} ->
        send(sender_pid, ticket_number + 1) |> process()
      :stop -> ticket_number
      _ -> process(ticket_number)
    end

  end
end
