$: << File.dirname(__FILE__)

class TictactoeBoardState

  attr_accessor :board_arr, :turn
  attr_reader :valid_slots

  def initialize (board_arr, turn = "X")
    @board_arr = board_arr
    @turn = turn
  end

  def move(input)
    played_move = TictactoeBoardState.new(@board_arr.dup, switch_turn("O", "X"))
    played_move.board_arr[input.to_i] = turn
    played_move
  end

  def switch_turn(x, o)
    turn == "X" ? x : o
  end

  def valid_slots
    @board_arr.each_with_index.map{|symbol, index| index if symbol==" "}.reject{|slots| slots == nil }
  end

end
