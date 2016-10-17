require 'stringio'
require './lib/game.rb'
require './lib/tic_tac_toe.rb'

describe Game do
  let(:ttt){TicTacToe.new}
  let(:new_game){Game.new(ttt)}

  describe '#initialize' do
    it 'with a new instance of TicTacToe' do
      expect(new_game.gametype).to eq(ttt)
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

end

