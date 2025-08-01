defmodule HighSchoolSweetheart do
  @string1 """
                ******       ******
              **      **   **      **
            **         ** **         **
           **            *            **
           **                         **
           """ <> "**"
  @string2 """
                **
            **                       **
              **                   **
                **               **
                  **           **
                    **       **
                      **   **
                        ***
                         *
           """
  def first_letter(name) do
    name |> String.trim() |> String.first()
  end

  def initial(name) do
    name |> first_letter() |> String.upcase() |> Kernel.<>(".")
  end

  def initials(full_name) do
    [first_name | [last_name | _]] = full_name |> String.split(" ")
    first_name |> initial() |> Kernel.<>(" ") |> Kernel.<>(initial(last_name))
  end

  def pair(full_name1, full_name2) do
    @string1 <> "     " <> initials(full_name1) <> "  +  " <> initials(full_name2) <> @string2
  end
end
