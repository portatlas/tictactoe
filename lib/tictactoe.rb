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


end


