class Board

  attr_reader :row_0, :row_1, :row_2, :grid

  def initialize
    @row_0 = ['', '', '']
    @row_1 = ['', '', '']
    @row_2 = ['', '', '']
    @grid = [@row_0, @row_1, @row_2]
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
    occupied_row?(row_0, player) || occupied_row?(row_1, player) || occupied_row?(row_2, player)
  end

  def occupied_row?(row, player)
    row.all? { |cell| cell == player }
  end

  def column_win?(player)
    occupied_column?(0, player) || occupied_column?(1, player) || occupied_column?(2, player)
  end

  def occupied_column?(column, player)
    [row_0[column], row_1[column], row_1[column]].all? { |cell| cell == player }
  end

  def diagonal_win?(player)
    [row_0[0], row_1[1], row_2[2]].all? { |cell| cell == player } || [row_0[2], row_1[1], row_2[0]].all? { |cell| cell == player }
  end


end
