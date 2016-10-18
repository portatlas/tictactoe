require 'game'
require './lib/console.rb'
require './lib/ui.rb'
require './lib/tictactoe.rb'

describe Console do
  let(:gametype){TicTacToe.new}
  let(:io){Console.new}
  let(:ui){Ui.new(io)}
  let(:new_game){Game.new({gametype: gametype, ui: ui})}

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
    it 'ask users to input the position on all available slots where they want to place an X' do
      output = capture_puts{ io.display_intro_msg(gametype)}

      expect(output).to include("Welcome to #{gametype.desc[:name]}")
      expect(output).to include(gametype.desc[:instructions])
    end
  end

  # describe '#winner' do
  #   it 'returns You won! if the user won the game' do
  #     new_game.gametype.won?("X")
  #     expect(io.display_winner_message(gametype)).to eq ("You won!")
  #   end

    # it 'returns Computer Won if the computer won the game' do
    #   io.gametype.board = ["O", "O", "X",
    #                              "X", "O", "X",
    #                              "X", "O", "O"]
    #   expect(io.winner).to eq "Computer won!"
    # end

    # it 'returns It\'s a draw! if there is no winner' do
    #   io.gametype.board = ["X", "O", "X",
    #                              "X", "O", "O",
    #                              "O", "X", "O"]
    #   expect(io.winner).to eq "It's a draw!"
    # end
  # end


end