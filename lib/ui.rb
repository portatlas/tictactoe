require_relative 'console'

class Ui
  attr_reader :io

  def initialize(io)
    @io = io
  end

  def display_intro_msg(game_being_played)
    io.display_intro_msg(game_being_played)
  end

  def prompt_user_for_input(game_being_played)
    io.prompt_user_for_input(game_being_played)
  end

  def show_board(board)
    io.show_board(board)
  end

  def get_user_input
    io.get_user_input
  end

  def display_winner_message(game_being_played)
    io.display_winner_message(game_being_played)
  end

end

