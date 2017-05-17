require_relative 'field'
require_relative 'player'

class Game

  attr_reader :board, :row_1, :row_2, :row_3
  attr_accessor :current_player

  def initialize
    @current_player = 'x'
    @row_1 = ['', '', '']
    @row_2 = ['', '', '']
    @row_3 = ['', '', '']
    @board = [@row_1, @row_2, @row_3]
  end

  def switch_player
    current_player == 'o' ? self.current_player = 'x' : self.current_player = 'o'
  end

  def take(x,y)
    raise 'cell already taken' if @board[x-1][y-1] != ''
    @board[x-1][y-1] = current_player
    winner? ? puts("#{current_player} wins!") : switch_player
  end

  def winner?
    true if row_win? || column_win? || diagonal_win?
  end

  def row_win?
    occupied_row?(row_1) || occupied_row?(row_2) || occupied_row?(row_3)
  end

  def occupied_row?(row)
    row.all? { |cell| cell == current_player }
  end

  def column_win?
    occupied_column?(0) || occupied_column?(1) || occupied_column?(2)
  end

  def occupied_column?(column)
    [row_1[column], row_2[column], row_3[column]].all? { |cell| cell == current_player }
  end

  def diagonal_win?
    [row_1[0], row_2[1], row_3[2]].all? { |cell| cell == current_player } || [row_1[2], row_2[1], row_3[0]].all? { |cell| cell == current_player }
  end

end
