require_relative '../lib/tic_tac_toe.rb'

describe TicTacToe do
  let(:ttt){TicTacToe.new}

  describe '#initialize' do
    it 'creates a empty board represented by an array of 9 slots' do
      expect(ttt.board).to eq([" ", " ", " ", " ", " ", " ", " ", " ", " "])
    end
  end

  describe '#move' do
    it 'will play the X symbol on to the first slot of the board given the index position 1' do
      ttt.move(1)
      played_board = ttt.board
      expect(played_board).to eq(["X", " ", " ", " ", " ", " ", " ", " ", " "])
    end

    it 'will play X on slot 1, and O on slot 2' do
      ttt.move(1)
      ttt.move(2)
      two_turn_board = ttt.board
      expect(two_turn_board).to eq(["X", "O", " ", " ", " ", " ", " ", " ", " "])
    end

    it 'will play X on slot 1, and O on slot 2, and X on slot 9' do
      ttt.move(1)
      ttt.move(2)
      ttt.move(9)
      played_board = ttt.board
      expect(played_board).to eq(["X", "O", " ", " ", " ", " ", " ", " ", "X"])
    end
  end

  describe '#valid_slots' do
    it 'returns an array of all the index_positions of the board when the board is empty' do
      expect(ttt.valid_slots).to eq ([0, 1, 2, 3, 4, 5, 6, 7, 8])
    end

    it 'returns an array of the index_positions where the slots are empty' do
      ttt.move(1)
      ttt.move(2)
      ttt.move(9)

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
      ttt.move(1)
      expect(ttt.valid_move?(1)).to eq false
    end

  end

  describe '#whose_turn' do
    it 'returns the X for the most recent turn that went' do
      ttt.move(1)
      ttt.move(2)
      ttt.move(9)
      expect(ttt.whose_turn).to eq "X"
    end

    it 'returns the symbol O for the most recent turn that went' do
      ttt.move(1)
      ttt.move(2)
      expect(ttt.whose_turn).to eq "O"
    end
  end

  describe 'WIN_COMBOS' do
    it 'is a nested array made up of 8 possible combinations of index positions of winning in tac toe' do
      expect(TicTacToe::WIN_COMBOS.length).to eq 8
    end

  end

end