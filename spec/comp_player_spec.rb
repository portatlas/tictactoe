require 'tictactoe_board'
require 'tictactoe_rules'
require 'comp_player'

describe CompPlayer do
  let(:ttt){TictactoeBoard.new}
  let(:ttt_rules){TictactoeRules.new}
  let(:comp_player){CompPlayer.new}

  describe '#minimax' do
    context 'a player wins' do
      it 'returns 1000 if on Xs are on the winning combo spots' do
        ttt.board_arr = ["X", "X", "X",
                         "O", "X", "X",
                         "O", "X", "O"]
        expect(comp_player.minimax(ttt, ttt_rules)).to eq 1000
      end

      it 'returns -1000 if Os are on the winning combo spot' do
        ttt.board_arr = ["X", "X", "O",
                         "O", "X", "X",
                         "O", "O", "O"]
        expect(comp_player.minimax(ttt, ttt_rules)).to eq -1000
      end
    end

    context 'draw' do
      it 'returns 0 if it is a draw' do
        ttt.board_arr = ["X", "O", "X",
                         "X", "O", "O",
                         "O", "X", "O"]
        expect(comp_player.minimax(ttt, ttt_rules)).to eq 0
      end

      it 'returns 0 if it is a draw' do
        ttt.board_arr = ["X", "O", "X",
                     "O", "O", "X",
                     "O", "X", "O"]
        expect(comp_player.minimax(ttt, ttt_rules)).to eq 0
      end
    end

    context 'one move away from win' do
      it 'returns 990 if X is one move away for a winning combo' do
        ttt = TictactoeBoard.new(["X", "X", " ", " ", " ", " ", " ", " ", " "], "X")
        expect(comp_player.minimax(ttt, ttt_rules)).to eq 990
      end

      it 'returns -990 if O is one more away for a winning combo' do
        ttt = TictactoeBoard.new([" ", " ", " ", " ", " ", " ", " ", "O", "O"], "O")
        expect(comp_player.minimax(ttt, ttt_rules)).to eq -990
      end
    end
  end

  describe '#optimal_move' do
    context 'when X is about to win' do
      it 'returns 2 as the index for the optimal move' do
          ttt = TictactoeBoard.new(["X", "X", " ", " ", " ", " ", " ", " ", " "], "X")
          expect(comp_player.optimal_move(ttt, ttt_rules)).to eq 2
      end

      it 'returns 4 as the index for the optimal move' do
          ttt = TictactoeBoard.new([" ", " ", " ", "X", " ", "X", " ", " ", " "], "X")
          expect(comp_player.optimal_move(ttt, ttt_rules)).to eq 4
      end

      it 'returns 8 as the index for the optimal move' do
          ttt = TictactoeBoard.new(["X", " ", " ", "O", "X", "X", " ", " ", " "], "X")
          expect(comp_player.optimal_move(ttt, ttt_rules)).to eq 8
      end
    end

    context 'when O is about to win' do
      it 'returns 8 as the index for the optimal move' do
          ttt = TictactoeBoard.new(["X", "X", " ", " ", " ", " ", "O", "O", " "], "O")
          expect(comp_player.optimal_move(ttt, ttt_rules)).to eq 8
      end

      it 'returns 4 as the index for the optimal move' do
          ttt = TictactoeBoard.new([" ", "O", " ", "X", "O", "X", " ", " ", " "], "O")
          expect(comp_player.optimal_move(ttt, ttt_rules)).to eq 7
      end

      it 'returns 8 as the index for the optimal move' do
          ttt = TictactoeBoard.new(["X", " ", "O", "O", "O", "X", " ", " ", " "], "O")
          expect(comp_player.optimal_move(ttt, ttt_rules)).to eq 6
      end
    end
  end

  describe '#comp_move' do
    it 'returns a TicTacToe board if a move is made' do
      played_ttt = TictactoeBoard.new
      played_ttt.board_arr = ["X", " ", " ",
                              " ", " ", " ",
                              " ", " ", " "]

      expect(comp_player.comp_move(played_ttt, ttt_rules)).to be_an_instance_of(TictactoeBoard)
    end

    # it 'returns nil if comp move was not made' do
    #   played_ttt = TictactoeBoard.new
    #   played_ttt.board_arr = ["X", "O", "X",
    #                           "O", "X", "O",
    #                           "O", "X", "O"]

    #   expect(comp_player.comp_move(played_ttt, ttt_rules)).to eq nil
    # end
  end

end