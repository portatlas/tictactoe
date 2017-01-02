$: << File.dirname(__FILE__)

class Console

  def show_board(board)
    puts " #{board[0]} " + "|" + " #{board[1]} " + "|" + " #{board[2]} "
    puts "- - - - - -"
    puts " #{board[3]} " + "|" + " #{board[4]} " + "|" + " #{board[5]} "
    puts "- - - - - -"
    puts " #{board[6]} " + "|" + " #{board[7]} " + "|" + " #{board[8]} "
  end

  def display_intro_msg(game_being_played)
    puts "Welcome to #{game_being_played.desc[:name]}"
    puts "#{game_being_played.desc[:instructions]}"
  end

  def prompt_user_for_input(game_being_played)
    puts "Enter a number #{game_being_played.valid_slots.join(", ")} to place an X"
  end

  def get_user_input
    gets.chomp.to_i
  end

  def display_invalid_input
    puts "Invalid input try again"
  end

  def display_winner_message(game_being_played)
    if game_being_played.won?("X")
      puts "X won!"
    elsif game_being_played.won?("O")
      puts "O won!"
    elsif game_being_played.draw?
      puts "It's a draw!"
    end
  end

end