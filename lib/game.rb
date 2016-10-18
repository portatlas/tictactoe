require_relative 'tic_tac_toe'

class Game

  attr_accessor :gametype, :ui

  def initialize(gametype = nil, ui = nil)
    @ui = ui
    @gametype = gametype
  end

  # def display_intro_msg
  #   puts "Welcome to #{gametype.desc[:name]} \n#{gametype.desc[:instructions]}"
  #   ui.show_board(gametype.board)
  # end

  def prompt_user_for_input
    "Enter a number #{@gametype.valid_slots.join(", ")} to place an X"
  end

  # def get_user_input
  #   user_input = gets.chomp.to_i
  # end

  def winner
    if gametype.won?("X")
      "You won!"
    elsif gametype.won?("O")
      "Computer won!"
    elsif gametype.draw?
      "It's a draw!"
    end
  end

  def user_move(index_position)
    if gametype.valid_move?(index_position)
      @gametype = gametype.move(index_position)
    else
      "Invalid input try again"
    end
  end

  def comp_move
    if !gametype.valid_slots.empty?
      @gametype = gametype.move(gametype.optimal_move)
    end
  end

  def alternate_move(user_input)
    user_move(user_input)
    comp_move
    ui.show_board(gametype.board)
    winner
  end

  def play
    ui.display_intro_msg(gametype)
    ui.show_board(gametype.board)
    while !gametype.game_over?
      puts prompt_user_for_input
      puts alternate_move(ui.get_user_input)
    end
  end

end
