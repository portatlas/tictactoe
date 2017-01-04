require 'console_game_engine'
require 'tictactoe_board'
require 'tictactoe_rules'
require 'comp_player'
require 'console'

describe ConsoleGameEngine do
  let(:ttt_board){TictactoeBoard.new}
  let(:io){Console.new}
  let(:rules){TictactoeRules.new}
  let(:comp_player){CompPlayer.new}
  let(:new_game){ConsoleGameEngine.new({gametype: ttt_board, rules: rules, comp_player: comp_player})}

  describe ' #initialize' do
    it 'with a new instance of TicTacToe' do
      expect(new_game.gametype).to eq(ttt_board)
    end
  end

  # describe '#alternate_move' do
  #   it 'plays the first turn of the game' do
  #     new_game.alternate_move
  #     board_after_first_move = new_game.gametype.board_arr

  #     expect(board_after_first_move).to match_array(["X", " ", " ",
  #                                                    " ", "O", " ",
  #                                                    " ", " ", " "])
  #   end
  # end

  describe '#play' do
    it 'continues to play as long as the game is not over' do
      expect(new_game).to receive(:play)
      new_game.play
    end

    it 'stops playing when the game is not over' do
      played_ttt = TictactoeBoard.new
      played_ttt.board_arr = ["X", "O", "X",
                              "O", "X", "O",
                              "O", "X", "O"]
        completed_game = ConsoleGameEngine.new({gametype: played_ttt})
        expect(completed_game).not_to receive(:play)
      end
  end

end

