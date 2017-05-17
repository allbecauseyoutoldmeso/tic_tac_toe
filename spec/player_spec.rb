require 'player'

describe Player do

  subject(:player) { described_class.new }

  describe '#fields' do
    it 'player is initialized without any fields' do
      expect(player.fields).to be_empty
    end
  end

  describe '#take' do
    it 'adds the selected field to the player\'s fields' do
      player.take(1,3)
      expect(player.fields.length).to eq 1 
    end
  end

end
