$: << File.dirname(__FILE__)

class GameEngine

  attr_reader :ttt_board_state, :player_1, :player_2, :rules

  def initialize(args)
    @ttt_board_state = args.fetch(:ttt_board_state, nil)
    @rules = args.fetch(:rules, nil)
    @player_1 = args.fetch(:player_1, nil)
    @player_2 = args.fetch(:player_2, nil)
  end

end
