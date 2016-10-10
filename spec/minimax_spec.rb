require_relative '../lib/tic_tac_toe.rb'
require 'pry'

describe TicTacToe do

  describe '#minimax' do
    context 'a player wins' do
      it 'returns 100 if it is a winning board is X' do
        board = ["X", "X", "X", "O", "X", "X", "O", "X", "O"]
        expect(TicTacToe.new(board, "X").check_branch).to eq 100
      end

      it 'returns -100 if it is a winning board is O' do
        board = ["X", "X", "O", "O", "X", "X", "O", "O", "O"]
        expect(TicTacToe.new(board, "O").check_branch).to eq -100
      end
    end

    context 'draw' do
      it 'returns 0 if it is a draw' do
        board = ["X", "O", "X", "X", "O", "O", "O", "X", "O"]
        expect(TicTacToe.new(board, "O").check_branch).to eq 0
      end
    end

    context 'one move away from win' do
      it 'returns 99 if it is a winning board is X' do
        board = ["X", "X", " ", " ", " ", " ", " ", " ", " "]
        expect(TicTacToe.new(board, "X").minimax).to eq 99
      end

      it 'returns -99 if it is a winning board is O' do
        board = [" ", " ", " ", " ", " ", " ", " ", "O", "O"]
        expect(TicTacToe.new(board, "O").minimax).to eq -99
      end
    end
  end

  describe '#optimal_move' do
    context 'when X is about to win' do
      it 'returns 2 as the index for the optimal move' do
          board = ["X", "X", " ", " ", " ", " ", " ", " ", " "]
          expect(TicTacToe.new(board, "X").optimal_move).to eq 2
      end

      it 'returns 4 as the index for the optimal move' do
          board = [" ", " ", " ", "X", " ", "X", " ", " ", " "]
          expect(TicTacToe.new(board, "X").optimal_move).to eq 4
      end

      it 'returns 8 as the index for the optimal move' do
          board = ["X", " ", " ", "O", "X", "X", " ", " ", " "]
          expect(TicTacToe.new(board, "X").optimal_move).to eq 8
      end
    end

    context 'when O is about to win' do
      it 'returns 8 as the index for the optimal move' do
          board = ["X", "X", " ", " ", " ", " ", "O", "O", " "]
          expect(TicTacToe.new(board, "O").optimal_move).to eq 8
      end

      it 'returns 4 as the index for the optimal move' do
          board = [" ", "O", " ", "X", "O", "X", " ", " ", " "]
          expect(TicTacToe.new(board, "O").optimal_move).to eq 7
      end

      it 'returns 8 as the index for the optimal move' do
          board = ["X", " ", "O", "O", "O", "X", " ", " ", " "]
          expect(TicTacToe.new(board, "O").optimal_move).to eq 6
      end
    end

  end
end