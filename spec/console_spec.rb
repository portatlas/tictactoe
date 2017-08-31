require 'console_game_engine'
require 'console'
require 'tictactoe_board_state'
require 'tictactoe_rules'

describe Console do
  let(:ttt_board){TictactoeBoardState.new}
  let(:console_io){Console.new}
  let(:rules){TictactoeRules.new}
  let(:new_game){Game.new({gametype: ttt_board, rules: rules})}

  describe '#get_user_input' do
    it 'returns the users input as a string' do
      allow(console_io).to receive(:gets).and_return("1")
      expect(console_io.get_user_input).to eq("1")
    end
  end

  describe '#display_msg' do
    it 'returns the message on the console' do
      message = "X won!"
      output = capture_puts{ console_io.display_msg(message)}
      expect(output).to include ("X won!")
    end
  end

end
