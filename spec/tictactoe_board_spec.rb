require 'tictactoe_board'

describe TictactoeBoard do
  let(:ttt){TictactoeBoard.new}

  describe '#initialize' do
    it 'creates a empty board represented by an array of 9 elements' do
      expect(ttt.board).to eq([" ", " ", " ", " ", " ", " ", " ", " ", " "])
    end
  end

  describe '#move' do
    it 'will play X on slot 1' do
      ttt = TictactoeBoard.new.move(0)
      expect(ttt.board).to eq(["X", " ", " ", " ", " ", " ", " ", " ", " "])
    end

    it 'will play X on slot 1, and O on slot 2' do
      ttt = TictactoeBoard.new.move(0).move(1)
      expect(ttt.board).to eq(["X", "O", " ", " ", " ", " ", " ", " ", " "])
    end

    it 'will play X on slot 1, and O on slot 2, and X on slot 9' do
      ttt = TictactoeBoard.new.move(0).move(1).move(8)
      played_board = ttt.board
      expect(played_board).to eq(["X", "O", " ", " ", " ", " ", " ", " ", "X"])
    end
  end

  describe ' #valid_slots' do
    it 'returns an array of all the index_positions of the board when the board is empty' do
      expect(ttt.valid_slots).to eq ([0, 1, 2, 3, 4, 5, 6, 7, 8])
    end

    it 'returns an array of the index_positions where the slots are empty' do
      played_board = TictactoeBoard.new.move(0).move(1).move(8)

      expect(played_board.valid_slots).to eq([2,3,4,5,6,7])
    end

    it 'returns an empty array when all the slots are taken' do
      full_board = TictactoeBoard.new.move(0).move(1).move(8).move(2).move(3).move(5).move(4).move(6).move(7)

      expect(full_board.valid_slots).to eq([])
    end
  end

  describe '#whose_turn' do
    it 'returns X when it is Xs turn' do
      ttt = TictactoeBoard.new.move(0).move(1).move(8)
      expect(ttt.whose_turn("O", "X")).to eq "X"
    end

    it 'returns O when it is Os turn' do
      ttt = TictactoeBoard.new.move(0).move(1)
      expect(ttt.whose_turn("O", "X")).to eq "O"
    end
  end

end