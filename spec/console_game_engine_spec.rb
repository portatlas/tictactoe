require 'board'
require 'stringify_board'
require 'tictactoe_board_state'
require 'console'
require 'tictactoe_rules'
require 'player_user'
require 'player_ai'
require 'console_game_engine'

describe ConsoleGameEngine do
  let(:new_board){Board.new}
  let(:ttt_board_state){TictactoeBoardState.new(new_board.array)}
  let(:console){Console.new}
  let(:ttt_rules){TictactoeRules.new}
  let(:user_player){PlayerUser.new(ttt_board_state: ttt_board_state, ui: console, rules: ttt_rules)}
  let(:comp_player){PlayerAi.new}
  let(:stringify_board){StringifyBoard.new}
  let(:new_game){ConsoleGameEngine.new({ttt_board_state: ttt_board_state, rules: ttt_rules, player_1: user_player, player_2: comp_player, ui: console, comp_player: comp_player, stringify_board: stringify_board})}

  describe '#initialize' do
    it 'with a new instance of TictactoeBoardState' do
      expect(new_game.ttt_board_state).to be_instance_of(TictactoeBoardState)
    end
  end

  describe '#play' do
    it 'continues to play as long as the game is not over' do
      expect(new_game).to receive(:play)
      new_game.play
    end

    it 'stops playing when the game is over' do
      played_ttt_board_state = TictactoeBoardState.new(new_board)
      played_ttt_board_state.board_arr = ["X", "O", "X",
                                          "O", "X", "O",
                                          "O", "X", "O"]
        completed_game = ConsoleGameEngine.new({ttt_board: played_ttt_board_state})
        expect(completed_game).not_to receive(:play)
      end
  end

end

