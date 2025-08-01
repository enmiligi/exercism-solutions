defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    path_list = String.split(path, ".")
    do_extract(data, path_list)
  end

  def do_extract(data, path_list)
  def do_extract(data, []), do: data
  def do_extract(data, [first | rest]), do: do_extract(data[first], rest)

  def get_in_path(data, path) do
    path_list = String.split(path, ".")
    get_in(data, path_list)
  end
end
