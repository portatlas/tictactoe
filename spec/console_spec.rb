require 'console_game_engine'
require 'console'
require 'ui'
require 'tictactoe_board'
require 'tictactoe_rules'

describe Console do
  let(:ttt_board){TictactoeBoard.new}
  let(:io){Console.new}
  let(:ui){Ui.new(io)}
  let(:rules){TictactoeRules.new}
  let(:new_game){Game.new({gametype: ttt_board, ui: ui, rules: rules})}

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


  describe '#winner' do
    it 'returns You won! if the user won the game' do
      win_board = ["X", "X", "X",
                   "O", "O", "X",
                   "X", "O", "O"]
      winning_game = TictactoeBoard.new
      winning_game.board_arr = win_board
      output = capture_puts{ io.display_winner_message(rules, winning_game)}
      expect(output).to include ("X won!")
    end

    it 'returns Computer won! if the user won the game' do
      comp_win_board = ["X", "O", " ",
                        "O", "O", "X",
                        "O", "O", "O"]
      winning_game = TictactoeBoard.new
      winning_game.board_arr = comp_win_board
      output = capture_puts{ io.display_winner_message(rules, winning_game)}
      expect(output).to include ("O won!")
    end

    it 'returns It is a draw! if no one won the game' do
      draw_board = ["X", "O", "O",
                    "O", "X", "X",
                    "X", "O", "O"]
      winning_game = TictactoeBoard.new
      winning_game.board_arr = draw_board
      output = capture_puts{ io.display_winner_message(rules, winning_game)}
      expect(output).to include ("It's a draw!")
    end
  end


end