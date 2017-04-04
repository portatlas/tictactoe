$: << File.dirname(__FILE__)
require 'game_engine'

class WebGameEngine < GameEngine

  def initialize(args)
    super
  end

  def versus_user(current_board, player, user_input)
    current_board = current_board.move(user_input)
  end

  def versus_comp(current_board, rules, player_1, player_1_input, player_2)
    current_board = current_board.move(player_1_input)
    current_board = current_board.move(player_2.optimal_move(current_board, rules))
  end

end
