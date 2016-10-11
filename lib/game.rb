require_relative 'tic_tac_toe'

class Game

  def initialize
    @ttt = TicTacToe.new
  end

  def get_user_input
    puts "Enter a number #{@ttt.valid_slots.join(", ")} to place an X"
    user_input = gets.chomp.to_i
  end

  def play
    puts "Welcome to Tic Tac toe"
    @ttt.show_board
    while !@ttt.game_over?
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
          break
        elsif @ttt.won?("O")
          puts ("Computer won!")
          break
        elsif @ttt.draw?
          puts ("It's a draw!")
          break
        end
      else
        puts "Invalid input try again"
      end
    end
  end

end
