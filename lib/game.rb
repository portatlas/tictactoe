$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'tictactoe'

class Game

  attr_accessor :gametype, :ui

  def initialize(args)
    @ui = args.fetch(:ui, nil)
    @gametype = args.fetch(:gametype, nil)
  end

  def comp_move
    if !gametype.valid_slots.empty?
      @gametype = gametype.move(gametype.optimal_move)
    end
  end

  def alternate_move
    index_position = ui.get_user_input
    if @gametype.valid_slots.include?(index_position)
      @gametype = gametype.move(index_position)
      comp_move
      ui.show_board(gametype.board)
      ui.display_winner_message(gametype)
    else
      ui.display_invalid_input
    end
  end

  def play
    ui.display_intro_msg(gametype)
    ui.show_board(gametype.board)
    while !gametype.game_over?
      ui.prompt_user_for_input(gametype)
      alternate_move
    end
  end

end