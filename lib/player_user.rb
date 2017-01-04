$: << File.dirname(__FILE__)

class PlayerUser

  def user_move(board, user_input)
    int_input = user_input.to_i
    board.move(int_input)
  end

end