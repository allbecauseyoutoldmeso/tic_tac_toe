require_relative 'board'
require_relative 'player'

class Game

  attr_reader :board
  attr_accessor :current_player

  def initialize
    @current_player = 'x'
    @board = Board.new
    # @row_1 = ['', '', '']
    # @row_2 = ['', '', '']
    # @row_3 = ['', '', '']
    # @board = [@row_1, @row_2, @row_3]
  end

  def switch_player
    current_player == 'o' ? self.current_player = 'x' : self.current_player = 'o'
  end

  def take(x,y)
    raise 'cell already taken' if board.grid[x-1][y-1] != ''
    board.grid[x-1][y-1] = current_player
    winner? ? puts("#{current_player} wins!") : switch_player
  end

  def winner?
    true if row_win? || column_win? || diagonal_win?
  end

  def row_win?
    occupied_row?(board.row_1) || occupied_row?(board.row_2) || occupied_row?(board.row_3)
  end

  def occupied_row?(row)
    row.all? { |cell| cell == current_player }
  end

  def column_win?
    occupied_column?(0) || occupied_column?(1) || occupied_column?(2)
  end

  def occupied_column?(column)
    [board.row_1[column], board.row_2[column], board.row_3[column]].all? { |cell| cell == current_player }
  end

  def diagonal_win?
    [board.row_1[0], board.row_2[1], board.row_3[2]].all? { |cell| cell == current_player } || [board.row_1[2], board.row_2[1], board.row_3[0]].all? { |cell| cell == current_player }
  end

end
