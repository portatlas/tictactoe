$: << File.dirname(__FILE__)

class TictactoeRules

  attr_reader :desc

  WIN_COMBOS = [[0,1,2],[3,4,5],[6,7,8],
                [0,3,6],[1,4,7],[2,5,8],
                [0,4,8],[2,4,6]]

  def initialize
    @desc = {
             name: "TacTacToe",
     instructions: "Two players take turns placing a 'X' and 'O' respectively on a 3 x 3 grid. The player who succeeds in placing three of their marks in a horizontal, vertical or diagonal row wins."}
  end

  def winning_indices(ttt_board, turn)
    WIN_COMBOS.detect do |win_combo|
      (ttt_board.board_arr[win_combo[0]]  == turn && ttt_board.board_arr[win_combo[1]]  == turn && ttt_board.board_arr[win_combo[2]]  == turn )
    end
  end

  def draw?(board, turn)
    board.valid_slots == [] && winning_indices(board, turn) == nil
  end

  def game_over?(board, turn)
    board.valid_slots == [] || winning_indices(board, "X") || winning_indices(board, "O") ? true : false
  end

  def winner(ttt_board, turn)
    if winning_indices(ttt_board, "X")
      "X won!"
    elsif winning_indices(ttt_board, "O")
      "O won!"
    elsif draw?(ttt_board, ttt_board.turn)
      "It's a draw!"
    end
  end



end