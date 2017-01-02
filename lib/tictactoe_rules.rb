class TictactoeRules

  WIN_COMBOS = [[0,1,2],[3,4,5],[6,7,8],
                [0,3,6],[1,4,7],[2,5,8],
                [0,4,8],[2,4,6]]

  def won?(board, turn)
    WIN_COMBOS.detect do |win_combo|
      (board.board[win_combo[0]]  == turn && board.board[win_combo[1]]  == turn && board.board[win_combo[2]]  == turn )
    end
  end

  def draw?(board, turn)
    board.valid_slots == [] && won?(board, turn) == nil
  end

  def game_over?(board)
    board.valid_slots == [] || won?(board, "X") || won?(board, "O") ? true : false
  end

end