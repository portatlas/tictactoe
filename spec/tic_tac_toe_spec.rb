require_relative '../lib/tic_tac_toe.rb'

describe TicTacToe do
  let(:ttt){TicTacToe.new}

  describe '#initialize' do
    it 'creates a empty board represented by an array of 9 slots' do
      expect(ttt.board).to eq([" ", " ", " ", " ", " ", " ", " ", " ", " "])
    end
  end


  describe '#move' do
    it 'lets a player place the X symbol on to the board' do
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
end