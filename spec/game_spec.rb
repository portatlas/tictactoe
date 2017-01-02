require 'game'
require 'tictactoe'
require 'tictactoe_rules'
require 'comp_player'
require 'console'
require 'ui'

describe Game do
  let(:gametype){TicTacToe.new}
  let(:io){Console.new}
  let(:ui){Ui.new(io)}
  let(:rules){TictactoeRules.new}
  let(:comp_player){CompPlayer.new}
  let(:new_game){Game.new({gametype: gametype, ui: ui, rules: rules, comp_player: comp_player})}

  describe ' #initialize' do
    it 'with a new instance of TicTacToe' do
      expect(new_game.gametype).to eq(gametype)
    end

    it 'with a new instance of Ui' do
      expect(new_game.ui).to eq(ui)
    end
  end

  describe '#comp_move' do
    it 'returns a TicTacToe board if a move is made' do
      played_ttt = TicTacToe.new
      played_ttt.board = ["X", " ", " ",
                          " ", " ", " ",
                          " ", " ", " "]
      first_move_game = Game.new({gametype: played_ttt, ui: ui, rules: rules, comp_player: comp_player })
      comp_move = first_move_game.comp_move
      expect(comp_move).to be_an_instance_of(TicTacToe)
    end

    it 'returns nil if comp move was not made' do
      played_ttt = TicTacToe.new
      played_ttt.board = ["X", "O", "X",
                          "O", "X", "O",
                          "O", "X", "O"]
      completed_game = Game.new({gametype: played_ttt, ui: ui, rules: rules, comp_player: comp_player})
      expect(completed_game.comp_move).to eq nil
    end
  end

  # describe '#alternate_move' do
  #   it 'plays the first turn of the game' do
  #     new_game.alternate_move
  #     board_after_first_move = new_game.gametype.board

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
      played_ttt = TicTacToe.new
      played_ttt.board = ["X", "O", "X",
                          "O", "X", "O",
                          "O", "X", "O"]
        completed_game = Game.new({gametype: played_ttt, ui: ui})
        expect(completed_game).not_to receive(:play)
      end
  end

end

