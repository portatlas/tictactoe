require_relative 'tic_tac_toe'

class Game

  attr_accessor :gametype, :ui

  def initialize(args)
    @ui = args.fetch(:ui, nil)
    @gametype = args.fetch(:gametype, nil)
  end

  def user_move
    index_position = get_user_input
    if gametype.valid_move?(index_position)
      @gametype = gametype.move(index_position)
    else
      puts "Invalid input try again"
    end
  end

  def get_user_input
    gets.chomp.to_i
  end

  def comp_move
    if !gametype.valid_slots.empty?
      @gametype = gametype.move(gametype.optimal_move)
    end
  end

  def alternate_move
    user_move
    comp_move
    ui.show_board(gametype.board)
    ui.display_winner_message(gametype)
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
