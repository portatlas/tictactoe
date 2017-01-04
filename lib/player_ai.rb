$: << File.dirname(__FILE__)

class PlayerAi

  def minimax(board, rules, increment = 10)
    return 1000 if rules.won?(board, "X")
    return -1000 if rules.won?(board, "O")
    return 0 if rules.draw?(board, board.turn)

    @@minimax_cache ||= {}
    value = @@minimax_cache[board]
    return value if value
    @@minimax_cache[board] = board.valid_slots.map{ |index| minimax(board.move(index), rules, increment + 10) }.send(board.whose_turn(:max, :min)) + board.whose_turn(-increment, increment)
  end

  def optimal_move(board, rules)
    board.valid_slots.send(board.whose_turn(:max_by, :min_by)){|index| minimax(board.move(index), rules)}
  end

  def ai_move(board, rules)
    board.move(optimal_move(board, rules))
  end

end