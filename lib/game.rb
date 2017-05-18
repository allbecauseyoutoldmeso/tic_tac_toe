require_relative 'board'
require_relative 'player'

class Game

  attr_reader :board, :ex, :oh
  attr_accessor :current_player

  def initialize
    @ex = Player.new('x')
    @oh = Player.new('o')
    @current_player = @ex
    @board = Board.new
  end

  def switch_player
    current_player == ex ? self.current_player = oh : self.current_player = ex
  end

  def take(row, column)
    board.take_cell(row, column, current_player.symbol)
    if board.wins?(current_player.symbol)
      puts("#{current_player.symbol} wins!")
      current_player.gain_points(1)
    elsif board.game_over?
      puts('draw!')
    else
      switch_player
    end
  end

end
