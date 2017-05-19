require_relative 'board'
require_relative 'player'

class Game

  attr_reader :cross, :nought
  attr_accessor :current_player, :board

  def initialize
    @cross = Player.new('x')
    @nought = Player.new('o')
    @current_player = @cross
    @board = Board.new(3)
  end

  def switch_player
    current_player == cross ? self.current_player = nought : self.current_player = cross
  end

  def play(row, column)
    take(row, column)
    if board.wins?(current_player.symbol) || board.full?
      end_game
    else
      switch_player
    end
  end

  def take(row,column)
    board.take_cell(row, column, current_player.symbol)
  end

  def end_game
    if board.wins?(current_player.symbol)
      winning_game
    else
      puts('draw!')
    end
      restart_game
  end

  def winning_game
    puts("#{current_player.symbol} wins!")
    current_player.gain_points(1)
  end

  def restart_game
    self.board = Board.new(3)
    switch_player
  end

end
