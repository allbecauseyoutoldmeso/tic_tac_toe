require 'game'

describe Game do

  subject(:game) { described_class.new }

  describe '#current_player' do
    it 'is initially x' do
      expect(game.current_player).to eq 'x'
    end
  end

  describe '#switch_player' do
    it 'changes the player' do
      game.switch_player
      expect(game.current_player).to eq 'o'
    end
  end

  describe '#take' do
    it 'sets a cell to the current player' do
      game.take(1,1)
      expect(game.board.grid[0][0]).to eq 'x'
    end
    it 'raises an error if try to take a cell that is already taken' do
      game.take(1,1)
      expect { game.take(1,1) }.to raise_error 'cell already taken'
    end
    it 'switches the player if nobody wins' do
      game.take(1,1)
      expect(game.current_player).to eq 'o'
    end
    it 'prints a win message if a player wins' do
      game.board.grid[0][0] = 'x'
      game.board.grid[0][1] = 'x'
      expect { game.take(1,3) }.to output("x wins!\n").to_stdout
    end
  end



end
