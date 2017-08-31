$: << File.dirname(__FILE__)

class Board

  attr_reader :array, :size

  def initialize
    @size = 3
    @array = Array.new(size * size, " ")
  end

end