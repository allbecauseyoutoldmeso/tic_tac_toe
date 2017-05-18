class Board

  attr_reader :grid

  def initialize
    @grid = [['', '', ''],
             ['', '', ''],
             ['', '', '']]
  end

  def cell_taken?(x,y)
    grid[x][y] != ''
  end

  def take_cell(x,y,player)
    grid[x][y] = player
  end

  def wins?(player)
    row_win?(player) || column_win?(player) || diagonal_win?(player)
  end

  def row_win?(player)
    occupied_row?(grid[0], player) || occupied_row?(grid[1], player) || occupied_row?(grid[2], player)
  end

  def occupied_row?(row, player)
    row.all? { |cell| cell == player }
  end

  def column_win?(player)
    occupied_column?(0, player) || occupied_column?(1, player) || occupied_column?(2, player)
  end

  def occupied_column?(column, player)
    [grid[0][column], grid[1][column], grid[2][column]].all? { |cell| cell == player }
  end

  def diagonal_win?(player)
    [grid[0][0], grid[1][1], grid[2][2]].all? { |cell| cell == player } || [grid[0][2], grid[1][1], grid[2][0]].all? { |cell| cell == player }
  end


end
