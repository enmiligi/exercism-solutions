defmodule NameBadge do
  def print(id, name, department) do
    id_string = if id, do: "[#{Integer.to_string(id)}] - ", else: ""
    department_string = if department, do: String.upcase(department), else: "OWNER"
    "#{id_string}#{name} - #{department_string}"
  end
end
