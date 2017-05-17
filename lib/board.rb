class Board

  attr_reader :row_1, :row_2, :row_3, :grid

  def initialize
    @row_1 = ['', '', '']
    @row_2 = ['', '', '']
    @row_3 = ['', '', '']
    @grid = [@row_1, @row_2, @row_3]
  end


end
