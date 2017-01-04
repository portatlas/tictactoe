$: << File.dirname(__FILE__)

class PlayerUser

  def user_move(board, rules, user_input)
    if board.valid_slots.include?(user_input)
      board.move(user_input)
    end
  end
end