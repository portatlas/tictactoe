$: << File.dirname(__FILE__)

class PlayerAi

  def optimal_move(board, rules)
    board.valid_slots.send(board.switch_turn(:max_by, :min_by)){|index| minimax(board.move(index), rules)}
  end

  private

  def minimax(board, rules, increment = 10)
    return 1000 if rules.winning_indices(board, "X")
    return -1000 if rules.winning_indices(board, "O")
    return 0 if rules.draw?(board, board.turn)

    @@minimax_cache ||= {}
    value = @@minimax_cache[board]
    return value if value
    @@minimax_cache[board] = board.valid_slots.map{ |index| minimax(board.move(index), rules, increment + 10) }.send(board.switch_turn(:max, :min)) + board.switch_turn(-increment, increment)
  end

end
