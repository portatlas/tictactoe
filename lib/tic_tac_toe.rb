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

  def won?(turn)
    WIN_COMBOS.detect do |win_combo|
      (@board[win_combo[0]]  == turn && @board[win_combo[1]]  == turn && @board[win_combo[2]]  == turn )
    end
  end

  def draw?
    valid_slots == [] && won?(turn) == nil
  end

  def game_over?
    valid_slots == []
  end

  def winner
    if game_over? && won?(turn)
      winning_board = won?(turn)
      @board[winning_board[0]] == "X" ? "X" : "O"
    elsif draw?
      nil
    end
  end

  def minimax(increment = 10)
    return 1000 if won?("X")
    return -1000 if won?("O")
    return 0 if draw?

    valid_slots.map{ |index| move(index).minimax(increment + 10) }.send(whose_turn(:max, :min)) + whose_turn(-increment, increment)
  end

  def optimal_move
    valid_slots.send(whose_turn(:max_by, :min_by)){|index| move(index).minimax}
  end

end


