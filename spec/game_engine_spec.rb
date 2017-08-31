require 'board'
require 'console'
require 'game_engine'
require 'tictactoe_board_state'
require 'tictactoe_rules'
require 'player_user'
require 'player_ai'

describe GameEngine do
  let(:console_io){Console.new}
  let(:new_board){Board.new}
  let(:ttt_board_state){TictactoeBoardState.new(new_board)}
  let(:ttt_rules){TictactoeRules.new}
  let(:comp_player){PlayerAi.new}
  let(:user_player_1){PlayerUser.new(ui: console_io)}
  let(:user_player_2){PlayerUser.new(ui: console_io)}
  let(:new_game){ GameEngine.new({ttt_board_state: ttt_board_state, rules: ttt_rules, player_1: user_player_1, player_2: user_player_2})}

  describe ' #initialize' do
    it 'with a new instance of TicTacToe' do
      expect(new_game.ttt_board_state).to eq(ttt_board_state)
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

