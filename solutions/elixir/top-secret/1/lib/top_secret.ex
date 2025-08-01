defmodule TopSecret do
  def to_ast(string) do
    Code.string_to_quoted!(string)
  end

  def decode_secret_message_part(ast, acc) do
    case ast do
      {:def, _, [{:when, _, [{name, _, arguments } | _]} | _]} ->
        function_part(name, arguments, acc, ast)
      {:def, _, [{name, _, arguments} | _]} ->
        function_part(name, arguments, acc, ast)
      {:defp, _, [{:when, _, [{name, _, arguments } | _]} | _]} ->
        function_part(name, arguments, acc, ast)
      {:defp, _, [{name, _, arguments} | _]} ->
        function_part(name, arguments, acc, ast)
      _ -> {ast, acc}
    end
  end

  defp function_part(name, arguments, acc, ast) do
    name_part = case arguments do
      [] -> ""
      [_ | _] ->
        String.slice(Atom.to_string(name), 0, length(arguments))
      _ -> ""
    end
    {ast, [name_part | acc]}
  end

  def decode_secret_message(string) do
    {_ast, message} = Macro.prewalk(to_ast(string), [], &decode_secret_message_part/2)
    message |> Enum.reverse() |> List.to_string()
  end
end
