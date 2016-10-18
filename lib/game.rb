require_relative 'tic_tac_toe'
# decisions vs dependency

class Game

  attr_accessor :gametype

  def initialize(gametype = nil)
    @gametype = gametype
  end

  def display_intro_msg
    puts "Welcome to #{gametype.desc[:name]} \n#{gametype.desc[:instructions]}"
    puts gametype.show_board
  end

  def prompt_user_for_input
    return "Enter a number #{@gametype.valid_slots.join(", ")} to place an X"
  end

  def get_user_input
    user_input = gets.chomp.to_i
  end

  def winner
    if gametype.won?("X")
      "You won!"
    elsif gametype.won?("O")
      "Computer won!"
    elsif gametype.draw?
      "It's a draw!"
    end
  end

  def alternate_move(input)
    if gametype.valid_slots.include?(input)
        @gametype = gametype.move(input)

        if ! gametype.valid_slots.empty?
          @gametype = gametype.move(gametype.optimal_move)
          gametype.show_board
        end

        puts winner

    else
      puts "Invalid input try again"
    end

  end

  def play
    display_intro_msg
    while !gametype.game_over?
      puts prompt_user_for_input
      puts alternate_move(get_user_input)
    end
  end

end
