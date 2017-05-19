class Board

  attr_reader :grid, :max

  def initialize(size)
    @grid = []
    size.times { @grid.push Array.new(size,'') }
    @max = size-1
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
    (0..max).to_a.any? { |column| grid.all? { |row| row[column] == symbol } }
  end

  def diagonal_win?(symbol)
    (0..max).collect { |n| grid[n][n] }.all? { |cell| cell == symbol } || (0..max).collect { |n| grid[n][max-n] }.all? { |cell| cell == symbol }
  end


end
