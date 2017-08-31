$: << File.dirname(__FILE__)

class StringifyBoard

  def board_to_grid(board)
    puts "\n-------------"
    board.each_slice(3) do |row|
      print "| "
      row.each do |slot|
        print "#{slot} | "
      end
      puts "\n-------------"
    end
  end

end
