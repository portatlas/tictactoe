$: << File.dirname(__FILE__)

class TicTacToe

  attr_accessor :board, :turn
  attr_reader :desc, :valid_slots


  def initialize (board = Array.new(9, " "), turn = "X")
    @board = board
    @turn = turn
    @desc = {
             name: "TacTacToe",
     instructions: "You (X) and the computer (O) will take turns placing a 'X' and 'O' respectively, the player who succeeds in placing three of their marks in a horizontal, vertical or diagonal row wins."}
  end

  def move(input)
      played_move = TicTacToe.new(@board.dup, whose_turn("O", "X"))
      played_move.board[input.to_i] = turn
      played_move
  end

  def valid_slots
    @board.each_with_index.map{|symbol, index| index if symbol==" "}.reject{|slots| slots == nil }
  end

  def whose_turn(x, o)
    turn == "X" ? x : o
  end

  # def won?(turn)
  #   WIN_COMBOS.detect do |win_combo|
  #     (@board[win_combo[0]]  == turn && @board[win_combo[1]]  == turn && @board[win_combo[2]]  == turn )
  #   end
  # end

  # def draw?
  #   valid_slots == [] && won?(turn) == nil
  # end

  # def game_over?
  #   valid_slots == [] || won?("X") || won?("O") ? true : false
  # end

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


