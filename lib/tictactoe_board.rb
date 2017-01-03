$: << File.dirname(__FILE__)

class TictactoeBoard

  attr_accessor :board, :turn
  attr_reader :valid_slots

  def initialize (board = Array.new(9, " "), turn = "X")
    @board = board
    @turn = turn
  end

  def move(input)
      played_move = TictactoeBoard.new(@board.dup, whose_turn("O", "X"))
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


