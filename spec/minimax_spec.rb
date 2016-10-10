require_relative '../lib/tic_tac_toe.rb'
require 'pry'

describe TicTacToe do
  # let(:ttt){TicTacToe.new}
  describe '#minimax' do
    context 'a player wins' do
      it "returns 1000 if it is a winning board is X" do
        board = ["X", "X", "X", "O", "X", "X", "O", "X", "O"]
        expect(TicTacToe.new(board, "X").minimax).to eq 1000
      end

      it "returns -1000 if it is a winning board is O" do
        board = ["X", "X", "O", "O", "X", "X", "O", "O", "O"]
        expect(TicTacToe.new(board, "O").minimax).to eq -1000
      end
    end

    context 'draw' do
      it "returns 0 if it is a draw" do
        board = ["X", "O", "X", "X", "O", "O", "O", "X", "O"]
        expect(TicTacToe.new(board, "O").minimax).to eq 0
      end
    end

    context 'one move away from win' do
      it "returns 990 if it is a winning board is X" do
        board = ["X", "X", " ", " ", " ", " ", " ", " ", " "]
        expect(TicTacToe.new(board, "X").minimax).to eq 990
      end

      it "returns -990 if it is a winning board is O" do
        board = [" ", " ", " ", " ", " ", " ", " ", "O", "O"]
        expect(TicTacToe.new(board, "O").minimax).to eq -990
      end
    end

  end
end