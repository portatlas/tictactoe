require './lib/game.rb'
require './lib/tic_tac_toe.rb'

describe Game do
  let(:ttt){TicTacToe.new}
  let(:new_game){Game.new(ttt)}

  describe '#initialize' do
    it 'with a new instance of TicTacToe' do
      expect(new_game.instance_variable_get(:@ttt)).to eq(ttt)
    end
  end

end