require 'tictactoe'
require 'tictactoe_rules'
require 'comp_player'

describe CompPlayer do
  let(:ttt){TicTacToe.new}
  let(:ttt_rules){TictactoeRules.new}
  let(:comp_player){CompPlayer.new}

  describe '#minimax' do
    context 'a player wins' do
      it 'returns 1000 if on Xs are on the winning combo spots' do
        ttt.board = ["X", "X", "X",
                     "O", "X", "X",
                     "O", "X", "O"]
        expect(comp_player.minimax(ttt, ttt_rules)).to eq 1000
      end

      it 'returns -1000 if Os are on the winning combo spot' do
        ttt.board = ["X", "X", "O",
                     "O", "X", "X",
                     "O", "O", "O"]
        expect(comp_player.minimax(ttt, ttt_rules)).to eq -1000
      end
    end

    context 'draw' do
      it 'returns 0 if it is a draw' do
        ttt.board = ["X", "O", "X",
                     "X", "O", "O",
                     "O", "X", "O"]
        expect(comp_player.minimax(ttt, ttt_rules)).to eq 0
      end

      it 'returns 0 if it is a draw' do
        ttt.board = ["X", "O", "X",
                     "O", "O", "X",
                     "O", "X", "O"]
        expect(comp_player.minimax(ttt, ttt_rules)).to eq 0
      end
    end

    context 'one move away from win' do
      it 'returns 990 if X is one move away for a winning combo' do
        ttt = TicTacToe.new(["X", "X", " ", " ", " ", " ", " ", " ", " "], "X")
        expect(comp_player.minimax(ttt, ttt_rules)).to eq 990
      end

      it 'returns -990 if O is one more away for a winning combo' do
        ttt = TicTacToe.new([" ", " ", " ", " ", " ", " ", " ", "O", "O"], "O")
        expect(comp_player.minimax(ttt, ttt_rules)).to eq -990
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