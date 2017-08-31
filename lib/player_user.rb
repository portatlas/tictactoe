$: << File.dirname(__FILE__)

class PlayerUser

  attr_reader :ttt_board_state, :ui, :rules

  def initialize(args = {})
    @ttt_board_state = args.fetch(:ttt_board_state, nil)
    @ui = args.fetch(:ui, nil)
    @rules = args.fetch(:rules, nil)
  end

  def user_move
    user_move_index_int = convert_to_i(ui.get_user_input)

    if rules.valid_move?(@ttt_board_state, user_move_index_int)
      user_move_index_int
    else
      ui.display_msg("Invalid Input, your input is out of bounds")
      user_move_index_int = convert_to_i(ui.get_user_input)
    end

  end

  private

    def convert_to_i(input)
      Integer(input)
    rescue
      ui.display_msg("Invalid Input, your entry was not a number")
      user_move_index_int = convert_to_i(ui.get_user_input)
    end

end
