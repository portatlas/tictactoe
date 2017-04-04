require 'board'
require 'console'
require 'tictactoe_board_state'
require 'tictactoe_rules'
require 'player_user'

describe PlayerUser do
  let(:console_io){Console.new}
  let(:new_board){Board.new}
  let(:ttt_board_state){TictactoeBoardState.new(new_board.array)}
  let(:ttt_rules){TictactoeRules.new}
  let(:player_user){PlayerUser.new(ttt_board_state: ttt_board_state, ui: console_io, rules: ttt_rules)}

  describe '#initialize' do
    it 'with an instance of a console' do
      expect(player_user.ui).to be_an_instance_of(Console)
    end
  end

  describe '#user_move' do
    it 'returns the user move as an integer' do
      allow(console_io).to receive(:gets).and_return("1")
      expect(player_user.user_move).to be 1
    end

    it 'displays Invalid Input if the move is invalid' do
      allow(console_io).to receive(:gets).and_return("110")
      output = capture_puts {player_user.user_move}
      expect(output).to include "Invalid Input, your input is out of bounds"
    end

  end

end