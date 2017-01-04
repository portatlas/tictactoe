$: << File.dirname(__FILE__)
require 'game_engine'

class WebGameEngine < GameEngine

  def initialize(args)
    super
  end

  def versus_user(current_board, player, user_input)
    if current_board.valid_move?(user_input)
      current_board = player.user_move(current_board, user_input)
    end
  end

  def versus_comp(current_board, rules, player_1, player_1_input, player_2)
    if current_board.valid_move?(player_1_input)
      current_board = player_1.user_move(current_board, player_1_input)
      current_board = player_2.ai_move(current_board, rules)
    end
  end

end