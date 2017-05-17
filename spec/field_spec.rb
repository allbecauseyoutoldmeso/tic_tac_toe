require 'field'

describe Field do

  subject(:field) { described_class.new(1, 3) }

  describe '#row' do
    it 'returns the row' do
      expect(field.row).to eq 1
    end
  end

  describe '#column' do
    it 'returns the colum' do
      expect(field.column).to eq 3
    end
  end

  describe '#taken' do
    it 'is false on initialization' do
      expect(field.taken).to eq false
    end
    it 'can be set to true' do
      field.taken = true
      expect(field.taken).to eq true
    end
  end

end
