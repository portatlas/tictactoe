require 'game'
require 'tictactoe'
require 'console'
require 'ui'

describe Game do
  let(:gametype){TicTacToe.new}
  let(:io){Console.new}
  let(:ui){Ui.new(io)}
  let(:new_game){Game.new({gametype: gametype, ui: ui})}

  describe ' #initialize' do
    it 'with a new instance of TicTacToe' do
      expect(new_game.gametype).to eq(gametype)
    end

    it 'with a new instance of Ui' do
      expect(new_game.ui).to eq(ui)
    end
  end

  # describe '#comp_move' do
  #   it 'allows the computer to make a move if their is an empty slot' do
  #     allow(new_game).to receive(:gets).and_return("0")
  #     expect(new_game.comp_move.board).to eq(["X", " ", " ",
  #                                             " ", "O", " ",
  #                                             " ", " ", " "])
  #   end
  # end

  describe '#alternate_move' do
    it 'plays the first turn of the game' do
      new_game.alternate_move
      board_after_first_move = new_game.gametype.board

      expect(board_after_first_move).to match_array(["X", " ", " ",
                                                     " ", "O", " ",
                                                     " ", " ", " "])
    end
  end

  describe '#play' do
    it 'user can enter their moves' do
      allow(new_game).to receive(:gets).and_return("0", "1", "2")
    end
  end

end

