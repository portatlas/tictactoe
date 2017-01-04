require 'console_game_engine'
require 'tictactoe_board'
require 'tictactoe_rules'
require 'player_ai'
require 'console'

describe ConsoleGameEngine do
  let(:ttt_board){TictactoeBoard.new}
  let(:console){Console.new}
  let(:ttt_rules){TictactoeRules.new}
  let(:comp_player){PlayerAi.new}
  let(:new_game){ConsoleGameEngine.new({ttt_board: ttt_board, rules: ttt_rules, comp_player: comp_player, ui: console})}

  describe ' #initialize' do
    it 'with a new instance of Console' do
      expect(new_game.ui).to eq(console)
    end
  end

  describe '#play' do
    it 'continues to play as long as the game is not over' do
      expect(new_game).to receive(:play)
      new_game.play
    end

    it 'stops playing when the game is over' do
      played_ttt = TictactoeBoard.new
      played_ttt.board_arr = ["X", "O", "X",
                              "O", "X", "O",
                              "O", "X", "O"]
        completed_game = ConsoleGameEngine.new({ttt_board: played_ttt})
        expect(completed_game).not_to receive(:play)
      end
  end

end

