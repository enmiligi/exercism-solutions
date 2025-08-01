class Minesweeper
  @mines : Array(Array(Int32))

  def initialize(strings)
    @mines = strings.map { |string|
      string.chars.map { |char| if char == '*'
        1
      else
        0
      end }
    }
    @rows = @mines.size
    if @rows == 0
      @columns = 0
    else
      @columns = @mines[0].size
    end
  end

  def value(row, column)
    if @mines[row][column] == 1
      return '*'
    else
      count = (([0, row - 1].max)..([@rows - 1, row + 1].min)).map { |r|
        @mines[r][[0, column - 1].max..[@columns - 1, column + 1].min].sum
      }.sum
      if count == 0
        return ' '
      else
        return count.to_s
      end
    end
  end

  def annotate
    return (0..@rows - 1).map { |r|
      (0..@columns - 1).map { |c| value(r, c) }.join
    }
  end
end
