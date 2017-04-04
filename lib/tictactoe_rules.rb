$: << File.dirname(__FILE__)

class TictactoeRules

  attr_reader :desc

  WIN_COMBOS = [[0,1,2],[3,4,5],[6,7,8],
                [0,3,6],[1,4,7],[2,5,8],
                [0,4,8],[2,4,6]]

  def initialize
    @desc = {
             name: "TacTacToe",
     instructions: "Two players take turns placing a 'X' and 'O' respectively on a 3 x 3 grid. The player who succeeds in placing three of their marks in a horizontal, vertical or diagonal row wins."}
  end

  def valid_move?(ttt_board_state, input_position)
     ttt_board_state.valid_slots.include?(input_position)
  end

  def winning_indices(ttt_board_state, turn)
    WIN_COMBOS.detect do |win_combo|
      (ttt_board_state.board_arr[win_combo[0]]  == turn &&
       ttt_board_state.board_arr[win_combo[1]]  == turn &&
       ttt_board_state.board_arr[win_combo[2]]  == turn )
    end
  end

  def game_result(ttt_board_state, turn)
    if winning_indices(ttt_board_state, "X")
      "X won!"
    elsif winning_indices(ttt_board_state, "O")
      "O won!"
    elsif draw?(ttt_board_state, ttt_board_state.turn)
      "It's a draw!"
    end
  end

  def draw?(ttt_board_state, turn)
    ttt_board_state.valid_slots == [] &&
    winning_indices(ttt_board_state, turn) == nil
  end

  def game_over?(ttt_board_state, turn)
    ttt_board_state.valid_slots == [] ||
    winning_indices(ttt_board_state, "X") ||
    winning_indices(ttt_board_state, "O") ? true : false
  end

end
