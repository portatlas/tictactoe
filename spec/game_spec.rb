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

  describe '#user_move' do
    it 'allows users to make a move if the user input is valid' do
      new_game.gametype.board = ["X", "O", " ",
                                 " ", " ", " ",
                                 " ", " ", " "]
      expect(new_game.user_move(3).board).to eq(["X", "O", " ",
                                                 "X", " ", " ",
                                                 " ", " ", " "])
    end

    it 'does not allow user to make a move and ask for a valid input when the input is invalid' do
      new_game.gametype.board = ["X", "O", " ",
                                 " ", " ", " ",
                                 " ", " ", " "]
      expect(new_game.user_move(0)).to eq("Invalid input try again")
    end
  end

  describe '#comp_move' do
    it 'allows the computer to make a move if their is an empty slot' do
      new_game.user_move(0)
      expect(new_game.comp_move.board).to eq(["X", " ", " ",
                                              " ", "O", " ",
                                              " ", " ", " "])
    end
  end

  describe '#alternate_move' do
    it 'plays the first turn of the game' do
      new_game.alternate_move(0)
      board_after_first_move = new_game.gametype.board

      expect(board_after_first_move).to match_array(["X", " ", " ",
                                                     " ", "O", " ",
                                                     " ", " ", " "])
    end
  end

  describe '#play' do
    it 'stops playing when there is a winner or a draw' do
      allow(new_game).to receive(:gets).and_return("0")
      expect(new_game).to receive(:gets).at_least(:once).and_return("0")

      new_game.play
    end
  end

end

