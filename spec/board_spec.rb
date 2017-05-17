require 'board'

describe Board do

  subject(:board) { described_class.new(3) }

  describe '#generate_coordinates' do
    it 'generates coordinates' do
      expect(board.generate_coordinates).to eq [[1,1],[1,2],[1,3],[2,1],[2,2],[2,3],[3,1],[3,2],[3,3]]
    end
  end

end
