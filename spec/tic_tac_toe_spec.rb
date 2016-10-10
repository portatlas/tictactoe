require_relative '../lib/tic_tac_toe.rb'

describe TicTacToe do
  describe '#initialize' do
    it 'creates a empty board represented by an array of 9 slots' do
      ttt = TicTacToe.new
      expect(ttt.instance_variable_get(:@board)).to eq([" ", " ", " ", " ", " ", " ", " ", " ", " ", ])
    end
  end
end