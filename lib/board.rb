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


end
