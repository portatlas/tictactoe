$: << File.dirname(__FILE__)

class ConsoleGameEngine

  attr_reader :gametype, :rules, :player_1, :player_2, :ui

  def initialize(args)
    @gametype = args.fetch(:gametype, nil)
    @rules = args.fetch(:rules, nil)
    @player_1 = args.fetch(:player_1, nil)
    @player_2 = args.fetch(:player_2, nil)
    @ui = args.fetch(:ui, nil)
  end

  def alternate_move
    index_position = ui.get_user_input
    if @gametype.valid_move?(index_position)
      @gametype = player_1.user_move(gametype, index_position)
      if !@gametype.valid_slots.empty?
        @gametype = player_2.ai_move(gametype, rules)
      end
      ui.show_board(@gametype.board_arr)
      ui.display_winner_message(rules, gametype)
    else
      ui.display_invalid_input
    end
  end

  def play
    ui.display_intro_msg(rules)
    ui.show_board(gametype.board_arr)
    while !rules.game_over?(gametype)
      ui.prompt_user_for_input(gametype)
      alternate_move
    end
  end

end

