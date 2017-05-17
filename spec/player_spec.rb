require 'player'

describe Player do

  subject(:player) { described_class.new }

  describe '#fields' do
    it 'player is initialized without any fields' do
      expect(player.fields).to be_empty
    end
  end

end
