require_relative 'board'
require_relative 'player'

class Game

  attr_reader :board
  attr_accessor :current_player

  def initialize
    @current_player = 'x'
    @board = Board.new
  end

  def switch_player
    current_player == 'o' ? self.current_player = 'x' : self.current_player = 'o'
  end

  def take(x,y)
    raise 'cell already taken' if board.cell_taken?(x,y)
    board.take_cell(x,y,current_player)
    winner?(current_player) ? puts("#{current_player} wins!") : switch_player
  end

  def winner?(player)
    board.row_win?(player) || board.column_win?(player) || board.diagonal_win?(player)
  end

end
