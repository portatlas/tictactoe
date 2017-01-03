$: << File.dirname(__FILE__)

class Ui
  attr_reader :io

  def initialize(io)
    @io = io
  end

  def display_intro_msg(rules)
    io.display_intro_msg(rules)
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

  def display_winner_message(game_being_played, rules)
    io.display_winner_message(game_being_played, rules)
  end

  def display_invalid_input
    io.display_invalid_input
  end

end

