require 'tictactoe_board'
require 'tictactoe_rules'
require 'player_user'

describe PlayerUser do
  let(:ttt){TictactoeBoard.new}
  let(:ttt_rules){TictactoeRules.new}
  let(:player_user){PlayerUser.new}

  describe '#user_move' do
    it 'returns a TicTacToe board if a move is made' do
      played_ttt = TictactoeBoard.new
      played_ttt.board_arr = ["X", " ", " ",
                              " ", " ", " ",
                              " ", " ", " "]

      expect(player_user.user_move(played_ttt, 2)).to be_an_instance_of(TictactoeBoard)
    end

    it 'moves the piece on the TicTacToe board if a move is made' do

      moved_board = player_user.user_move(ttt, 0)

      expect(moved_board.board_arr).to eq ["X", " ", " ",
                                           " ", " ", " ",
                                           " ", " ", " "]
    end

  end

end