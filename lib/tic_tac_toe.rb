class TicTacToe

  attr_accessor :board

  WIN_COMBOS = [[0,1,2],[3,4,5],[6,7,8],
                [0,3,6],[1,4,7],[2,5,8],
                [0,4,8],[2,4,6]]

  def initialize (turn = "X")
    @board = Array.new(9, " ")
    @turn = turn
  end

  def show_board
    puts " #{@board[0]} " + " #{@board[1]} " + " #{@board[2]} "
    puts " #{@board[3]} " + " #{@board[4]} " + " #{@board[5]} "
    puts " #{@board[6]} " + " #{@board[7]} " + " #{@board[8]} "
  end

  def move(input)
    if valid_move?(input)
      @board[input - 1] = @turn
      @turn = whose_turn
    end
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
end