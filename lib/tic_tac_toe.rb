require 'pry'

class TicTacToe

  attr_accessor :board, :turn

  WIN_COMBOS = [[0,1,2],[3,4,5],[6,7,8],
                [0,3,6],[1,4,7],[2,5,8],
                [0,4,8],[2,4,6]]

  def initialize (board = Array.new(9, " "), turn = "X")
    @board = board
    @turn = turn
  end

  def show_board
    puts " #{@board[0]} " + "|" + " #{@board[1]} " + "|" + " #{@board[2]} "
    puts "- - - - - -"
    puts " #{@board[3]} " + "|" + " #{@board[4]} " + "|" + " #{@board[5]} "
    puts "- - - - - -"
    puts " #{@board[6]} " + "|" + " #{@board[7]} " + "|" + " #{@board[8]} "
  end

  def move(input)
      played_move = TicTacToe.new(@board.dup, whose_turn("O", "X"))
      played_move.board[input.to_i] = turn
      played_move
  end

  def valid_slots
    @board.each_with_index.map{|symbol, index| index if symbol==" "}.reject{|slots| slots == nil }
  end

  def valid_move?(input)
    valid_slots.include?(input)
  end

  def whose_turn(x, o)
    turn == "X" ? x : o
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

  def minimax(increment = 10)
    return 1000 if winner == "X"
    return -1000 if winner == "O"
    return 0 if draw?

    valid_slots.map{ |index| move(index).minimax(increment + 10) }.send(whose_turn(:max, :min)) + whose_turn(- increment, increment)
  end

  def optimal_move
    valid_slots.send(whose_turn(:max_by, :min_by)){|index| move(index).minimax}
  end

end


class Game

  def initialize
    @ttt = TicTacToe.new
  end

  def play
    puts "Welcome to Tic Tac toe"
    @ttt.show_board
    puts "Enter a number from 0 to 8"
    user_input = gets.chomp
    @ttt = @ttt.move(user_input)
    p "these are the valid slots"
    p @ttt.valid_slots
    # p "What is this -----"
    # p ! @ttt.valid_slots.empty?
    # p "What is this -----"
    if ! @ttt.valid_slots.empty? then
        index = @ttt.optimal_move
        p "----- this is the index"
        p index
        p "----- this is the index"
        @ttt.move(index).show_board
      end
  end

end


new_game = Game.new
new_game.play