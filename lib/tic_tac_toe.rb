require 'pry'

class TicTacToe

  attr_accessor :board, :turn, :move

  WIN_COMBOS = [[0,1,2],[3,4,5],[6,7,8],
                [0,3,6],[1,4,7],[2,5,8],
                [0,4,8],[2,4,6]]

  def initialize (board = Array.new(9, " "), turn = "X")
    @board = board
    @turn = turn
    @movelist = Array.new
  end

  def show_board
    puts " #{@board[0]} " + "|" + " #{@board[1]} " + "|" + " #{@board[2]} "
    puts "- - - - - -"
    puts " #{@board[3]} " + "|" + " #{@board[4]} " + "|" + " #{@board[5]} "
    puts "- - - - - -"
    puts " #{@board[6]} " + "|" + " #{@board[7]} " + "|" + " #{@board[8]} "
  end

  def move(input)
    @board[input] = @turn
    @turn = whose_turn
    self
  end

  def unmove
    binding.pry
    @board[@movelist.pop] = " "
    @turn = whose_turn
    self
  end

  # def move(input)
  #   if valid_move?(input)
  #     played_move = TicTacToe.new(@board.dup, whose_turn("O", "X"))
  #     played_move.board[input] = turn
  #     played_move
  #   end
  # end

  def valid_slots
    @board.each_with_index.map{|symbol, index| index if symbol==" "}.reject{|slots| slots == nil }
  end

  def valid_move?(input)
    valid_slots.include?(input)
  end

  def whose_turn
    turn == "X" ? "O" : "X"
  end

  def won?
    WIN_COMBOS.detect do |win_combo|
      (@board[win_combo[0]]  == "X" && @board[win_combo[1]]  == "X" && @board[win_combo[2]]  == "X" ||
      @board[win_combo[0]]  == "O" && @board[win_combo[1]]  == "O" && @board[win_combo[2]] == "O")
    end
  end

  def draw?
    valid_slots == [] && !won?
  end

  def game_over?
    won? != [] || draw?
  end

  def winner
    if game_over? && won?
      winning_board = won?
      @board[winning_board[0]] == "X" ? "X" : "O"
    elsif draw?
      nil
    end
  end

  def check_branch
    return 100 if winner == "X"
    return -100 if winner == "O"
    return 0 if draw?
  end

  def minimax(index = nil)
    move(index) if index

    branch_value = check_branch
    return branch_value if check_branch

    # valid_slots.map{ |index| move(index).minimax(increment + 10) }.send(whose_turn(:max, :min)) + whose_turn(- increment, increment)
    valid_slots.map { |index| minimax(index).send(@turn == "X" ? :- : :+, @movelist.count+1)}.send(@turn == "X" ? :max : :min)
  end

  def optimal_move
    valid_slots.send(@turn == "X" ? :max_by : :min_by){|index| move(index).minimax}
  end

end

class Game

  # def ask_for_player
  #   puts "Who do you want to play first?"
  #   puts "1. human"
  #   puts "2. computer"
  #   while true
  #     print "choice: "
  #     ans = gets.chomp
  #     return "human"    if ans == "1"
  #     return "computer" if ans == "2"
  #   end
  # end

  def get_user_input
    puts "Enter the slot you want"
    user_input = gets.chomp
    return user_input.to_i
  end

  def other_player
    @player == "human" ? "computer" : "human"
  end

  def play
    # @player = ask_for_player
    puts "Lets Play Tic Tac Toe!"
    ttt = TicTacToe.new
    ttt.move(7)
    puts ttt.show_board
      # binding.pry
    # while ttt.game_over?

      index = get_user_input
      ttt.move(0)
      ttt.show_board
      @player = other_player

    # end
    # if ttt.draw?
    #   puts "It is a draw"
    # else
    #   puts "Winner"
    # end
  end


end

if __FILE__ == $0
  Game.new.play
end