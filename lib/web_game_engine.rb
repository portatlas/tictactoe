$: << File.dirname(__FILE__)

class WebGameEngine

  attr_reader :ttt_board

  def initialize(args)
    @ttt_board = args.fetch(:ttt_board, nil)
  end

end