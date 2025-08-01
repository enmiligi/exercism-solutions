defmodule LogParser do
  def valid_line?(line) do
    line =~ ~r/^\[(DEBUG|INFO|WARNING|ERROR)\].*$/
  end

  def split_line(line) do
    Regex.split(~r/<[~\*=-]*>/, line)
  end

  def remove_artifacts(line) do
    Regex.replace(~r/end-of-line\d+/i, line, "")
  end

  def tag_with_user_name(line) do
    match = Regex.run(~r/User[[:space:]]+([[:graph:]]+)(\s|$)/u, line)
    if match, do: "[USER] #{Enum.at(match, 1)} " <> line, else: line
  end
end
