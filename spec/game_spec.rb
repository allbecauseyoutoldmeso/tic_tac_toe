require 'game'

describe Game do

  subject(:game) { described_class.new }

  describe '#current_player' do
    it 'is initially x' do
      expect(game.current_player.symbol).to eq 'x'
    end
  end

  describe '#switch_player' do
    it 'changes the player' do
      game.switch_player
      expect(game.current_player.symbol).to eq 'o'
    end
  end

  describe '#play' do
    it 'sets a cell to the current player' do
      game.play(0,0)
      expect(game.board.grid[0][0]).to eq 'x'
    end
    it 'raises an error if try to take a cell that is already taken' do
      game.play(0,0)
      expect { game.play(0,0) }.to raise_error 'cell already taken'
    end
    it 'switches the player if nobody wins' do
      game.play(0,0)
      expect(game.current_player.symbol).to eq 'o'
    end
    it 'prints a win message if a player wins' do
      game.board.grid[0][0] = 'x'
      game.board.grid[0][1] = 'x'
      expect { game.play(0,2) }.to output("x wins!\n").to_stdout
    end
    it 'prints a draw message if neither player wins' do
      game.board.grid[0][0] = 'x'
      game.board.grid[0][1] = 'x'
      game.board.grid[0][2] = 'o'
      game.board.grid[1][0] = 'o'
      game.board.grid[1][1] = 'o'
      game.board.grid[1][2] = 'x'
      game.board.grid[2][0] = 'o'
      game.board.grid[2][1] = 'x'
      expect { game.play(2,2) }.to output("draw!\n").to_stdout
    end
    it 'starts a new game if game over' do
      game.board.grid[0][0] = 'x'
      game.board.grid[0][1] = 'x'
      game.play(0,2)
      expect(game.board.grid.all? { |row| row.all? { |cell| cell == '' } }).to be_truthy
    end
    it 'allocates points to the winning player' do
      game.board.grid[0][0] = 'x'
      game.board.grid[0][1] = 'x'
      game.play(0,2)
      expect(game.cross.points).to eq 1
    end
  end



end
