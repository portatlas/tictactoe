require 'board'
require 'tictactoe_board_state'
require 'tictactoe_rules'
require 'player_ai'

describe PlayerAi do
  let(:new_board){Board.new}
  let(:ttt_board_state){TictactoeBoardState.new(new_board)}
  let(:ttt_rules){TictactoeRules.new}
  let(:comp_player){PlayerAi.new}

  describe '#optimal_move' do
    context 'when X is about to win' do
      it 'returns 2 as the index for the optimal move' do
          ttt_board_state = TictactoeBoardState.new(["X", "X", " ", " ", " ", " ", " ", " ", " "], "X")
          expect(comp_player.optimal_move(ttt_board_state, ttt_rules)).to eq 2
      end

      it 'returns 4 as the index for the optimal move' do
          ttt_board_state = TictactoeBoardState.new([" ", " ", " ", "X", " ", "X", " ", " ", " "], "X")
          expect(comp_player.optimal_move(ttt_board_state, ttt_rules)).to eq 4
      end

      it 'returns 8 as the index for the optimal move' do
          ttt_board_state = TictactoeBoardState.new(["X", " ", " ", "O", "X", "X", " ", " ", " "], "X")
          expect(comp_player.optimal_move(ttt_board_state, ttt_rules)).to eq 8
      end
    end

    context 'when O is about to win' do
      it 'returns 8 as the index for the optimal move' do
          ttt_board_state = TictactoeBoardState.new(["X", "X", " ", " ", " ", " ", "O", "O", " "], "O")
          expect(comp_player.optimal_move(ttt_board_state, ttt_rules)).to eq 8
      end

      it 'returns 4 as the index for the optimal move' do
          ttt_board_state = TictactoeBoardState.new([" ", "O", " ", "X", "O", "X", " ", " ", " "], "O")
          expect(comp_player.optimal_move(ttt_board_state, ttt_rules)).to eq 7
      end

      it 'returns 8 as the index for the optimal move' do
          ttt_board_state = TictactoeBoardState.new(["X", " ", "O", "O", "O", "X", " ", " ", " "], "O")
          expect(comp_player.optimal_move(ttt_board_state, ttt_rules)).to eq 6
      end
    end
  end

end
