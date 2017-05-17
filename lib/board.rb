class Board

  attr_reader :row_1, :row_2, :row_3, :grid

  def initialize
    @row_1 = ['', '', '']
    @row_2 = ['', '', '']
    @row_3 = ['', '', '']
    @grid = [@row_1, @row_2, @row_3]
  end

  def cell_taken?(x,y)
    grid[x-1][y-1] != ''
  end

  def take_cell(x,y,player)
    grid[x-1][y-1] = player
  end

  def row_win?(player)
    occupied_row?(row_1, player) || occupied_row?(row_2, player) || occupied_row?(row_3, player)
  end

  def occupied_row?(row, player)
    row.all? { |cell| cell == player }
  end

  def column_win?(player)
    occupied_column?(0, player) || occupied_column?(1, player) || occupied_column?(2, player)
  end

  def occupied_column?(column, player)
    [row_1[column], row_2[column], row_3[column]].all? { |cell| cell == player }
  end

  def diagonal_win?(player)
    [row_1[0], row_2[1], row_3[2]].all? { |cell| cell == player } || [row_1[2], row_2[1], row_3[0]].all? { |cell| cell == player }
  end


end
