$: << File.dirname(__FILE__)
require 'game_engine'

class ConsoleGameEngine < GameEngine

  attr_reader :ui

  def initialize(args)
    super
    @ui = args.fetch(:ui, nil)
  end

  def alternate_move
    ui.prompt_user_for_input(ttt_board)
    index_position = ui.get_user_input
    if @ttt_board.valid_move?(index_position)
      @ttt_board = player_1.user_move(ttt_board, index_position)
      if !@ttt_board.valid_slots.empty?
        @ttt_board = player_2.ai_move(ttt_board, rules)
      end
      ui.show_board(@ttt_board.board_arr)
    else
      ui.display_invalid_input
    end
  end

  def play
    ui.display_intro_msg(rules)
    ui.show_board(ttt_board.board_arr)
    while !rules.game_over?(ttt_board, ttt_board.turn)
      alternate_move
    end
    message = rules.winner(ttt_board, ttt_board.turn)
    ui.display_results(message)
  end

end

