require_relative 'tic_tac_toe'
# decisions vs dependency

class Game

  attr_accessor :ttt

  def initialize(tictactoe = nil)
    @ttt = tictactoe
  end

  def prompt_user_for_input
    return "Enter a number #{@ttt.valid_slots.join(", ")} to place an X"
  end

  def get_user_input
    user_input = gets.chomp.to_i
  end

  def play
    puts "Welcome to Tic Tac toe"
    @ttt.show_board
    while !@ttt.game_over?
      puts prompt_user_for_input
      input = get_user_input

      if @ttt.valid_slots.include?(input)
        @ttt = @ttt.move(input)

        if ! @ttt.valid_slots.empty? then
          index = @ttt.optimal_move
          @ttt = @ttt.move(index)
          @ttt.show_board
        end

        if @ttt.won?("X")
          puts ("You won!")
        elsif @ttt.won?("O")
          puts ("Computer won!")
        elsif @ttt.draw?
          puts ("It's a draw!")
        end

      else
        puts "Invalid input try again"
      end

    end
  end

end
