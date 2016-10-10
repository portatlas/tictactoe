class TicTacToe

  attr_accessor :board

  def initialize (turn = "X")
    @board = Array.new(9, " ")
    @turn = turn
  end

  def show_board
    puts " #{@board[0]} " + " #{@board[1]} " + " #{@board[2]} "
    puts " #{@board[3]} " + " #{@board[4]} " + " #{@board[5]} "
    puts " #{@board[6]} " + " #{@board[7]} " + " #{@board[8]} "
  end

  def move(idx_pos)
    @board[idx_pos - 1] = @turn
    @turn = whose_turn
  end

  def valid_slots
    @board.each_with_index.map{|symbol, index| index if symbol==" "}.reject{|slots| slots == nil }
  end

  def valid_move?(input)
    valid_slots.include?(input - 1)
  end

  def whose_turn
    @turn == "X" ? "O" : "X"
  end

end