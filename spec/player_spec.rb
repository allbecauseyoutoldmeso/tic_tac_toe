require 'player'

describe Player do

  subject(:player) { described_class.new('x') }

  describe '#symbol' do
    it 'returns x or o' do
      expect(player.symbol).to eq 'x'
    end
  end

  describe '#points' do
    it 'is initialized as 0' do
      expect(player.points).to eq 0
    end
  end

  describe '#gain_points' do
    it 'increases the points' do
      player.gain_points(1)
      expect(player.points).to eq 1
    end
  end

end
