require 'console_game_engine'
require 'console'
require 'tictactoe_board'
require 'tictactoe_rules'

describe Console do
  let(:ttt_board){TictactoeBoard.new}
  let(:io){Console.new}
  let(:rules){TictactoeRules.new}
  let(:new_game){Game.new({gametype: ttt_board, rules: rules})}

  describe '#show_board' do
    it 'puts to the screen a tic tac toe board' do
      board = ["O", "O", "X",
               "X", "O", "X",
               "X", "O", "O"]

      output = capture_puts{ io.show_board(board)}

      expect(output).to include(" O | O | X ")
      expect(output).to include("- - - - - ")
      expect(output).to include(" X | O | X ")
      expect(output).to include("- - - - - ")
      expect(output).to include(" X | O | O ")
    end
  end

  describe '#display_intro_msg' do
    it 'puts the intro message for the game' do
      output = capture_puts{ io.display_intro_msg(rules)}

      expect(output).to include("Welcome to #{rules.desc[:name]}")
      expect(output).to include(rules.desc[:instructions])
    end
  end

  describe '#prompt_user_for_input' do
    it 'ask users to input the position on all available slots where they want to place an X' do
      output = capture_puts{ io.prompt_user_for_input(ttt_board)}

      expect(output).to include("Enter a number #{ttt_board.valid_slots.join(", ")} to place an X")
    end
  end

  describe '#display_invalid_input' do
    it 'displays a invalid message when user inputs is invalid' do
      output = capture_puts{ io.display_invalid_input}

      expect(output).to include("Invalid input try again")
    end
  end

  describe '#get_user_input' do
    it 'should return the users input' do
      allow(io).to receive(:gets).and_return("1")
      expect(io.get_user_input).to be(1)
    end
  end


  describe '#display_results' do
    it 'returns X won! if the X won the game' do
      x_win =  TictactoeBoard.new(["X", "O", "X",
                                   "O", "X", "X",
                                   "O", "O", "X"], "X")
      message = rules.winner(x_win, x_win.turn)
      output = capture_puts{ io.display_results(message)}
      expect(output).to include ("X won!")
    end

    it 'returns O won! if the user won the game' do
      o_win =  TictactoeBoard.new(["O", "X", "X",
                                   "X", "O", "X",
                                   "X", "O", "O"], "O")
      message = rules.winner(o_win, o_win.turn)
      output = capture_puts{ io.display_results(message)}
      expect(output).to include ("O won!")
    end

    it 'returns It is a draw! if no one won the game' do
      draw_board =  TictactoeBoard.new(["O", "X", "O",
                                        "O", "X", "X",
                                        "X", "O", "O"], "O")
      message = rules.winner(draw_board, draw_board.turn)
      output = capture_puts{ io.display_results(message)}
      expect(output).to include ("It's a draw!")
    end
  end


end