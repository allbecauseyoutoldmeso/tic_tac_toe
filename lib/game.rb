require_relative 'board'
require_relative 'player'

class Game

  attr_reader :cross, :nought
  attr_accessor :current_player, :board

  def initialize
    @cross = Player.new('x')
    @nought = Player.new('o')
    @current_player = @cross
    @board = Board.new
  end

  def switch_player
    current_player == cross ? self.current_player = nought : self.current_player = cross
  end

  def take(row, column)
    board.take_cell(row, column, current_player.symbol)
    if board.wins?(current_player.symbol)
      puts("#{current_player.symbol} wins!")
      current_player.gain_points(1)
      self.board = Board.new
    elsif board.game_over?
      puts('draw!')
      self.board = Board.new
    else
      switch_player
    end
  end

end
