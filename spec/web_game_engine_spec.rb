require 'board'
require 'web_game_engine'
require 'tictactoe_board_state'
require 'tictactoe_rules'
require 'player_user'
require 'player_ai'

describe WebGameEngine do
  let(:new_board){Board.new}
  let(:ttt_board_state){TictactoeBoardState.new(new_board.array)}
  let(:ttt_rules){TictactoeRules.new}
  let(:comp_player){PlayerAi.new}
  let(:user_player_1){PlayerUser.new}
  let(:user_player_2){PlayerUser.new}
  let(:new_game_user){ WebGameEngine.new({ttt_board_state: ttt_board_state, rules: ttt_rules, player_1: user_player_1, player_2: user_player_2})}
  let(:new_game_comp){ WebGameEngine.new({ttt_board_state: ttt_board_state, rules: ttt_rules, player_1: user_player_1, player_2: comp_player})}


  describe ' #versus_user' do
    it 'returns an instance of a TictactoeBoardState' do
      expect(new_game_user.versus_user(ttt_board_state, user_player_1, 0 )).to be_an_instance_of(TictactoeBoardState)
    end
  end

  describe ' #versus_comp' do
    it 'returns an instance of a TictactoeBoardState' do
      expect(new_game_comp.versus_comp(ttt_board_state, ttt_rules, user_player_1, 0, comp_player)).to be_an_instance_of(TictactoeBoardState)
    end
  end


end

