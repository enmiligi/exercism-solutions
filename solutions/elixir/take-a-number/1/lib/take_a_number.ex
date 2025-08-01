defmodule TakeANumber do
  def start() do
    spawn(fn -> process() end)
  end

  defp process(ticket_number \\ 0) do
    receive do
      {:report_state, sender_pid} ->
        send(sender_pid, ticket_number)
        process(ticket_number)
      {:take_a_number, sender_pid} ->
        send(sender_pid, ticket_number + 1)
        process(ticket_number + 1)
      :stop -> ticket_number
      _ -> process(ticket_number)
    end

  end
end
