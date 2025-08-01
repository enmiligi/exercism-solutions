class Minesweeper
  @mines : Array(String)

  def initialize(mines)
    @mines = mines
  end

  def annotate
    @mines.map_with_index do |row, row_idx|
      row.chars.map_with_index do |col, col_idx|
        count = [-1, 0, 1].cartesian_product([-1, 0, 1]).count { |x, y| ((@mines + [""])[x + row_idx] + " ")[y + col_idx]? == '*' }
        count == 0 || col != ' ' ? col : count
      end.join
    end
  end
end
