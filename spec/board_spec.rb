require 'board'

describe Board do

  subject(:board) { described_class.new }

  describe '#wins?' do
    it 'returns true if player has whole row' do
      board.grid[0][0] = 'x'
      board.grid[0][1] = 'x'
      board.grid[0][2] = 'x'
      expect(board.wins?('x')).to be_truthy
    end
    it 'returns true if player has whole column' do
      board.grid[0][2] = 'x'
      board.grid[1][2] = 'x'
      board.grid[2][2] = 'x'
      expect(board.wins?('x')).to be_truthy
    end
    it 'returns true if player has whole diagonal' do
      board.grid[0][0] = 'x'
      board.grid[1][1] = 'x'
      board.grid[2][2] = 'x'
      expect(board.wins?('x')).to be_truthy
    end
  end

end
