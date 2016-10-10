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
    it 'returns an array of all the index_positions of the board when the board is empty' do
      expect(ttt.valid_slots).to eq ([0, 1, 2, 3, 4, 5, 6, 7, 8])
    end

    it 'returns an array of the index_positions where the slots are empty' do
      ttt.move(1, "X")
      ttt.move(2, "O")
      ttt.move(9, "X")

      played_board = ttt.board
      expect(ttt.valid_slots).to eq([2,3,4,5,6,7])
    end

    it 'returns an empty array when all the slots are taken' do
      full_board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
      ttt.board = full_board
      expect(ttt.valid_slots).to eq([])
    end
  end

  describe '#valid_move?' do
    it 'returns true if the move is made on an empty board' do
      expect(ttt.valid_move?(1)).to eq true
    end

    it 'returns true if the move is made on a valid_slot' do
      played_board = ["X", "O", "X", "O", "X", "X", " ", "X", "O"]
      ttt.board = played_board
      expect(ttt.valid_move?(7)).to eq true
    end

    it 'returns false if the move is out of range' do
      expect(ttt.valid_move?(100)).to eq false
    end

    it 'returns false if the move is made on a slot that is taken' do
      ttt.move(1, "X")
      expect(ttt.valid_move?(1)).to eq false
    end

  end

end