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

  def take_cell(row, column, player)
    raise 'cell already taken' if cell_taken?(row, column)
    grid[row][column] = player
  end

  def game_over?
    grid.all? { |row| row.all? { |cell| cell != '' } }
  end

  def wins?(player)
    row_win?(player) || column_win?(player) || diagonal_win?(player)
  end

  def row_win?(player)
    grid.any? { |row| row.all? { |cell| cell == player } }
  end

  # def occupied_row?(row, player)
  #   row.all? { |cell| cell == player }
  # end

  def column_win?(player)
    [0, 1, 2].any? { |column| grid.all? { |row| row[column] == player } }
    # occupied_column?(0, player) || occupied_column?(1, player) || occupied_column?(2, player)
  end

  # def occupied_column?(column, player)
  #   [grid[0][column], grid[1][column], grid[2][column]].all? { |cell| cell == player }
  # end

  def diagonal_win?(player)
    [grid[0][0], grid[1][1], grid[2][2]].all? { |cell| cell == player } || [grid[0][2], grid[1][1], grid[2][0]].all? { |cell| cell == player }
  end


end
