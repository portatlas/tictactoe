$: << File.dirname(__FILE__)

class ConsoleGameEngine

  attr_reader :gametype, :rules, :comp_player, :ui, :first_player

  def initialize(args)
    @gametype = args.fetch(:gametype, nil)
    @rules = args.fetch(:rules, nil)
    @first_player = args.fetch(:first_player, nil)
    @comp_player = args.fetch(:comp_player, nil)
    @ui = args.fetch(:ui, nil)
  end

  def alternate_move
    index_position = ui.get_user_input
    if @gametype.valid_move?(index_position)
      @gametype = first_player.user_move(gametype, index_position)
      if !@gametype.valid_slots.empty?
        @gametype = comp_player.ai_move(gametype, rules)
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
