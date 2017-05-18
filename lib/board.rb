class Board

  attr_reader :grid

  def initialize
    @grid = [['', '', ''],
             ['', '', ''],
             ['', '', '']]
  end

  def cell_taken?(row, column)
    grid[row][column] != ''
  end

  def take_cell(row, column, symbol)
    raise 'cell already taken' if cell_taken?(row, column)
    grid[row][column] = symbol
  end

  def full?
    grid.all? { |row| row.all? { |cell| cell != '' } }
  end

  def wins?(symbol)
    row_win?(symbol) || column_win?(symbol) || diagonal_win?(symbol)
  end

  def row_win?(symbol)
    grid.any? { |row| row.all? { |cell| cell == symbol } }
  end

  def column_win?(symbol)
    [0, 1, 2].any? { |column| grid.all? { |row| row[column] == symbol } }
  end

  def diagonal_win?(symbol)
    [grid[0][0], grid[1][1], grid[2][2]].all? { |cell| cell == symbol } || [grid[0][2], grid[1][1], grid[2][0]].all? { |cell| cell == symbol }
  end


end
