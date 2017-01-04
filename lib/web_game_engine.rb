$: << File.dirname(__FILE__)

class WebGameEngine

  attr_accessor :ttt_board, :comp_player, :rules

  def initialize(args)
    @ttt_board = args.fetch(:ttt_board, nil)
    @comp_player = args.fetch(:comp_player, nil)
    @rules = args.fetch(:rules, nil)
  end


end