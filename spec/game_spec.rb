require 'stringio'
require './lib/game.rb'
require './lib/tic_tac_toe.rb'

describe Game do
  let(:gametype){TicTacToe.new}
  let(:new_game){Game.new(gametype)}

  describe '#initialize' do
    it 'with a new instance of TicTacToe' do
      expect(new_game.gametype).to eq(gametype)
    end
  end

  describe '#prompt_user_for_input' do
    it 'ask users to input the position on all available slots where they want to place an X' do
      expect(new_game.prompt_user_for_input).to eq("Enter a number 0, 1, 2, 3, 4, 5, 6, 7, 8 to place an X")
    end
  end

  describe '#get_user_input' do
    it 'takes in a user input and returns an integer' do
      allow(new_game).to receive(:gets).and_return("2")
      expect(new_game.get_user_input).to eq(2)
    end
  end

  describe '#winner' do
    it 'returns You won! if the user won the game' do
      new_game.gametype.board = ["X", "X", "X",
                                 "O", "X", "X",
                                 "O", "X", "O"]
      expect(new_game.winner).to eq ("You won!")
    end

    it 'returns Computer Won if the computer won the game' do
      new_game.gametype.board = ["O", "O", "X",
                                 "X", "O", "X",
                                 "X", "O", "O"]
      expect(new_game.winner).to eq "Computer won!"
    end

    it 'returns It\'s a draw! if there is no winner' do
      new_game.gametype.board = ["X", "O", "X",
                                 "X", "O", "O",
                                 "O", "X", "O"]
      expect(new_game.winner).to eq "It's a draw!"
    end
  end


end

