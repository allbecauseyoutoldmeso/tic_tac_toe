require 'board'

describe Board do

  subject(:board) { described_class.new(3) }

  describe '#grid' do
    it 'can be initialized with a specified size' do
      expect(board.grid).to eq [['','',''],
                                ['','',''],
                                ['','','']]
    end
  end

  describe '#cell_taken' do
    it 'is true if cell is taken' do
      board.grid[0][0] = 'x'
      expect(board.cell_taken?(0,0)).to be_truthy
    end
  end

  describe '#take_cell' do
    it 'sets a cell to x or o' do
      board.take_cell(0,0,'x')
      expect(board.grid[0][0]).to eq 'x'
    end
    it 'raises an error if cell is taken' do
      board.take_cell(0,0,'x')
      expect { board.take_cell(0,0,'o') }.to raise_error 'cell already taken'
    end
  end

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

  describe '#full?' do
    it 'returns true if all cells are filled' do
      board.grid.each { |row| row.each { |cell| cell.replace('x') } }
      expect(board.full?).to be_truthy
    end
  end

end
