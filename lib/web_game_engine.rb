$: << File.dirname(__FILE__)
require 'game_engine'

class WebGameEngine < GameEngine

  # attr_accessor :ttt_board
  # attr_reader :player_1, :player_2, :rules

  def initialize(args)
    @ttt_board = args.fetch(:ttt_board, nil)
    @player_1 = args.fetch(:player_1, nil)
    @player_2 = args.fetch(:player_2, nil)
    @rules = args.fetch(:rules, nil)
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