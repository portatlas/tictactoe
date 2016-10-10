require_relative '../lib/tic_tac_toe.rb'

describe TicTacToe do
  let(:ttt){TicTacToe.new}

  describe '#initialize' do
    it 'creates a empty board represented by an array of 9 slots' do
      expect(ttt.board).to eq([" ", " ", " ", " ", " ", " ", " ", " ", " "])
    end
  end

  describe '#move' do
    it 'will play symbol on to the board given the index position of the board and the symbol to place' do
      ttt.move(1, "X")

      played_board = ttt.board
      expect(played_board).to eq(["X", " ", " ", " ", " ", " ", " ", " ", " "])

      ttt.move(2, "O")
      played_board = ttt.board
      expect(played_board).to eq(["X", "O", " ", " ", " ", " ", " ", " ", " "])

      ttt.move(9, "X")
      played_board = ttt.board
      expect(played_board).to eq(["X", "O", " ", " ", " ", " ", " ", " ", "X"])
    end
  end

  describe '#valid_slots' do
    it 'returns an array of index_positions that are blank spaces' do
      expect(ttt.valid_slots).to eq ([0, 1, 2, 3, 4, 5, 6, 7, 8])

      ttt.move(1, "X")
      ttt.move(2, "O")
      ttt.move(9, "X")

      played_board = ttt.board
      expect(played_board).to eq([2,3,4,5,6,7])
    end
  end
end