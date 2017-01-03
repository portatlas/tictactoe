$: << File.dirname(__FILE__)

class TictactoeBoard

  attr_accessor :board_arr, :turn
  attr_reader :valid_slots

  def initialize (board_arr = Array.new(9, " "), turn = "X")
    @board_arr = board_arr
    @turn = turn
  end

  def move(input)
      played_move = TictactoeBoard.new(@board_arr.dup, whose_turn("O", "X"))
      played_move.board_arr[input.to_i] = turn
      played_move
  end

  def valid_slots
    @board_arr.each_with_index.map{|symbol, index| index if symbol==" "}.reject{|slots| slots == nil }
  end

  def whose_turn(x, o)
    turn == "X" ? x : o
  end


end


