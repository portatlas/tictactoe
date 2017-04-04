$: << File.dirname(__FILE__)

class Console

  def get_user_input
    gets.chomp
  end

  def display_msg(message)
    puts "#{message}"
  end

end
