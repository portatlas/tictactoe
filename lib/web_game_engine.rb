$: << File.dirname(__FILE__)

class WebGameEngine

  attr_reader :ttt_board
  attr_accessor :comp_player

  def initialize(args)
    @ttt_board = args.fetch(:ttt_board, nil)
    @comp_player = args.fetch(:comp_player, nil)
  end

end