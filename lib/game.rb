require_relative 'tic_tac_toe'
# decisions vs dependency

class Game

  attr_accessor :gametype

  def initialize(gametype = nil)
    @gametype = gametype
  end

  def prompt_user_for_input
    return "Enter a number #{@gametype.valid_slots.join(", ")} to place an X"
  end

  def get_user_input
    user_input = gets.chomp.to_i
  end

  def alternate_move(input)
    if @gametype.valid_slots.include?(input)
        @gametype = @gametype.move(input)

        if ! @gametype.valid_slots.empty?
          index = @gametype.optimal_move
          @gametype = @gametype.move(index)
          @gametype.show_board
        end

        if @gametype.won?("X")
          puts ("You won!")
        elsif @gametype.won?("O")
          puts ("Computer won!")
        elsif @gametype.draw?
          puts ("It's a draw!")
        end

    else
      puts "Invalid input try again"
    end

  end

  def play
    puts "Welcome to Tic Tac toe"
    gametype.show_board
    while !gametype.game_over?
      puts prompt_user_for_input
      input = get_user_input
      puts alternate_move(input)
    end
  end

end
