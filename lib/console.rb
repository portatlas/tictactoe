$: << File.dirname(__FILE__)

class Console

  def show_board(board)
    puts " #{board[0]} " + "|" + " #{board[1]} " + "|" + " #{board[2]} "
    puts "- - - - - -"
    puts " #{board[3]} " + "|" + " #{board[4]} " + "|" + " #{board[5]} "
    puts "- - - - - -"
    puts " #{board[6]} " + "|" + " #{board[7]} " + "|" + " #{board[8]} "
  end

  def display_intro_msg(rules)
    puts "Welcome to #{rules.desc[:name]}"
    puts "#{rules.desc[:instructions]}"
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

  # def display_winner_message(rules, game_being_played)
  #   if rules.winning_indices(game_being_played, "X")
  #     puts "X won!"
  #   elsif rules.winning_indices(game_being_played, "O")
  #     puts "O won!"
  #   elsif rules.draw?(game_being_played, game_being_played.turn)
  #     puts "It's a draw!"
  #   end
  # end

  def display_results(message)
    puts "#{message}"
  end

end