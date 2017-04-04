$: << File.dirname(__FILE__)
require 'game_engine'

class ConsoleGameEngine < GameEngine

  attr_reader :ui, :stringify_board

  def initialize(args)
    super
    @ui = args.fetch(:ui, nil)
    @stringify_board = args.fetch(:stringify_board, nil)
  end

  def play
    ui.display_msg("Welcome to #{rules.desc[:name]}\n#{rules.desc[:instructions]}")
    ui.display_msg(stringify_board.board_to_grid(ttt_board_state.board_arr))
    while !rules.game_over?(ttt_board_state, ttt_board_state.turn)
      alternate_move
    end
    ui.display_msg(rules.game_result(ttt_board_state, ttt_board_state.turn))
  end

  def alternate_move
    ui.display_msg("Enter a number #{@ttt_board_state.valid_slots.join(", ")} to place an X")
    if !@ttt_board_state.valid_slots.empty?
      @ttt_board_state = @ttt_board_state.move(player_1.user_move)
      @ttt_board_state = @ttt_board_state.move(player_2.optimal_move(ttt_board_state, rules))
    end
    ui.display_msg(stringify_board.board_to_grid(ttt_board_state.board_arr))
  end

end
