require 'game_engine'
require 'tictactoe_board'
require 'tictactoe_rules'
require 'player_user'
require 'player_ai'

describe GameEngine do
  let(:board){TictactoeBoard.new}
  let(:ttt_rules){TictactoeRules.new}
  let(:comp_player){PlayerAi.new}
  let(:user_player_1){PlayerUser.new}
  let(:user_player_2){PlayerUser.new}
  let(:new_game){ GameEngine.new({ttt_board: board, rules: ttt_rules, player_1: user_player_1, player_2: user_player_2})}

  describe ' #initialize' do
    it 'with a new instance of TicTacToe' do
      expect(new_game.ttt_board).to eq(board)
    end

    it 'with a new instance of TicTacToeRules' do
      expect(new_game.rules).to eq(ttt_rules)
    end

    it 'with a new instance of PlayerUser' do
      expect(new_game.player_1).to eq(user_player_1)
    end

    it 'with a new instance of PlayerUser' do
      expect(new_game.player_2).to eq(user_player_2)
    end
  end

end

