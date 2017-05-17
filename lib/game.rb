require_relative 'field'
require_relative 'player'

class Game

  attr_reader :board
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
    if @board[x-1][y-1] == ''
      @board[x-1][y-1] = @current_player
      switch_player
    else
      raise 'cell already taken'
    end
  end

  def winner?
    if row_win?
      true
    end
  end

  def row_win?
    @row_1.all? { |cell| cell == @current_player } || @row_1.all? { |cell| cell == @current_player } || @row_1.all? { |cell| cell == @current_player }
  end


end
