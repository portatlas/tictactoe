$: << File.dirname(__FILE__)

class WebGameEngine

  attr_accessor :ttt_board
  attr_reader :player_1, :player_2, :rules

  def initialize(args)
    @ttt_board = args.fetch(:ttt_board, nil)
    @player_1 = args.fetch(:player_1, nil)
    @player_2 = args.fetch(:player_2, nil)
    @rules = args.fetch(:rules, nil)
  end


end