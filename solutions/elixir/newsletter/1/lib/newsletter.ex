defmodule Newsletter do
  def read_emails(path) do
    String.split(File.read!(path), "\n", trim: true)
  end

  def open_log(path) do
    File.open!(path, [:write])
  end

  def log_sent_email(pid, email) do
    IO.puts(pid, email)
  end

  def close_log(pid) do
    File.close(pid)
  end

  def send_newsletter(emails_path, log_path, send_fun) do
    emails = read_emails(emails_path)
    log = open_log(log_path)
    Enum.map(emails, fn mail -> case send_fun.(mail) do
      :ok -> log_sent_email(log, mail)
        :ok
      _ -> :bad
    end end)
    :ok
  end
end
