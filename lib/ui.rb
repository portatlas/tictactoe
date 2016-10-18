require_relative 'console'

class Ui
  attr_reader :io

  def initialize(io)
    @io = io
  end

  def display_intro_msg(game_being_played)
    io.display_intro_msg(game_being_played)
  end

  def show_board(board)
    io.show_board(board)
  end

  def get_user_input
    io.get_user_input
  end

end

