require 'board'
require 'tictactoe_board_state'
require 'tictactoe_rules'

describe TictactoeRules do
  let(:new_board){Board.new}
  let(:ttt_board_state){TictactoeBoardState.new(new_board.array)}
  let(:ttt_rules){TictactoeRules.new}

  describe '#valid_move?' do
    it 'returns true if the move is a valid move' do
      expect(ttt_rules.valid_move?(ttt_board_state, 0)).to be true
    end

    it 'returns false if the move is already taken' do
      board_slot2_taken = ttt_board_state.move(2)
      expect(ttt_rules.valid_move?(board_slot2_taken, 2)).to be false
    end

    it 'returns false if the move is out of bounds' do
      expect(ttt_rules.valid_move?(ttt_board_state, 11)).to be false
    end

    it 'returns false if the move is not a number' do
      expect(ttt_rules.valid_move?(ttt_board_state, "a")).to be false
    end
  end

  describe 'WIN_COMBOS' do
    it 'is a nested array made up of 8 possible combinations of winning index positions' do
      expect(TictactoeRules::WIN_COMBOS.length).to eq 8
    end

    it 'provides the right combinations for row wins' do
      expect(TictactoeRules::WIN_COMBOS).to include([0,1,2] && [3,4,5] && [6,7,8])
    end

    it 'provides the right combinations for column wins' do
      expect(TictactoeRules::WIN_COMBOS).to include([0,3,6] && [1,4,7] && [2,5,8])
    end

    it 'provides the right combinations for diagnal wins' do
      expect(TictactoeRules::WIN_COMBOS).to include([0,4,8] && [2,4,6])
    end
  end

  describe '#winning_indices' do
    context 'returns the winning indices' do
      it 'for the top row of the winning combination' do
        ttt_board_state.board_arr = ["X", "X", "X",
                                     "O", "O", "X",
                                     "O", "X", "O"]
        expect(ttt_rules.winning_indices(ttt_board_state, "X")).to eq [0,1,2]
      end

      it 'for the second row of the winning combination' do
        ttt_board_state.board_arr = ["X", "O", "X",
                                     "O", "O", "O",
                                     "X", "X", "O"]
        expect(ttt_rules.winning_indices(ttt_board_state, "O")).to eq [3,4,5]
      end

      it 'for the bottom row of the winning combination' do
        ttt_board_state.board_arr = ["X", "O", "X",
                                     "O", "X", "O",
                                     "X", "X", "X"]
        expect(ttt_rules.winning_indices(ttt_board_state, "X")).to eq [6,7,8]
      end

      it 'for the first column of the winning combination' do
        ttt_board_state.board_arr = ["X", "O", "X",
                                     "X", "O", "X",
                                     "X", "O", "O"]
        expect(ttt_rules.winning_indices(ttt_board_state, "X")).to eq [0,3,6]
      end

      it 'for the second column of the winning combination' do
        ttt_board_state.board_arr = ["O", "O", "X",
                                     "X", "O", "X",
                                     "X", "O", "O"]
        expect(ttt_rules.winning_indices(ttt_board_state, "O")).to eq [1,4,7]
      end

      it 'for the third column of the winning combination' do
        ttt_board_state.board_arr = ["X", "O", "X",
                                     "O", "O", "X",
                                     "O", "X", "X"]
        expect(ttt_rules.winning_indices(ttt_board_state, "X")).to eq [2,5,8]
      end

      it 'for the north west to south east diagonal of the winning combination' do
        ttt_board_state.board_arr = ["O", "X", "X",
                                     "X", "O", "X",
                                     "X", "O", "O"]
        expect(ttt_rules.winning_indices(ttt_board_state, "O")).to eq [0,4,8]
      end

      it 'for the north east to south west of the winning combination' do
        ttt_board_state.board_arr = ["X", "O", "X",
                                     "O", "X", "X",
                                     "X", "O", "O"]
        expect(ttt_rules.winning_indices(ttt_board_state, "X")).to eq [2,4,6]
      end
    end

    context 'returns nil' do
      it 'if there is no winning combination' do
        ttt_board_state.board_arr = ["X", "O", "X",
                                     "X", "O", "O",
                                     "O", "X", "O"]
        expect(ttt_rules.winning_indices(ttt_board_state, "X")).to eq nil
      end

      it 'if there is an open slot' do
        ttt_board_state.board_arr = ["X", "O", "X",
                                     "X", " ", "O",
                                     "O", "X", "O"]
        expect(ttt_rules.winning_indices(ttt_board_state, "X")).to eq nil
      end
    end
  end

  describe '#draw?' do
    it 'returns true if no one wins and the board is full' do
        ttt_board_state.board_arr = ["X", "O", "X",
                                     "X", "O", "O",
                                     "O", "X", "O"]
        expect(ttt_rules.draw?(ttt_board_state, "X")).to eq true
    end

    it 'returns false if the board has open slots' do
        ttt_board_state.board_arr = ["X", "O", "X",
                                     "X", "O", " ",
                                     "O", "X", "O"]
        expect(ttt_rules.draw?(ttt_board_state, "O")).to eq false
    end

    it 'returns false if a player won' do
        ttt_board_state.board_arr = ["X", "X", "X",
                                     "X", "O", " ",
                                     "O", "X", "O"]
        expect(ttt_rules.draw?(ttt_board_state, "O")).to eq false
    end
  end

  describe ' #game_over?' do
    it 'returns true if someone won' do
      ttt_board_state.board_arr = ["X", "O", "X",
                                   "O", "X", "X",
                                   "O", "X", "X"]
      p ttt_board_state
      expect(ttt_rules.game_over?(ttt_board_state, ttt_board_state.turn)).to eq true
    end

    it 'returns true if there is a tie' do
      ttt_board_state.board_arr = ["X", "O", "X",
                                   "X", "O", "O",
                                   "O", "X", "O"]
      expect(ttt_rules.game_over?(ttt_board_state, ttt_board_state.turn)).to eq true
    end

    it 'returns false if there is an open slot' do
      ttt_board_state.board_arr = ["X", "O", "X",
                                   "O", " ", " ",
                                   "O", "X", "X"]
      expect(ttt_rules.game_over?(ttt_board_state, ttt_board_state.turn)).to eq false
    end
  end

  describe ' #game_result' do
    it 'returns X if X won' do
      ttt_board_state.board_arr = ["X", "X", "X",
                                   "O", " ", " ",
                                   "O", "X", "X"]
      expect(ttt_rules.game_result(ttt_board_state, "X")).to eq "X won!"
    end

    it 'returns O if O won' do
      ttt_board_state.board_arr = ["O", "X", "X",
                                   "X", "O", "X",
                                   "X", "O", "O"]
      expect(ttt_rules.game_result(ttt_board_state, "O")).to eq "O won!"
    end

    it 'returns its a draw if no one won' do
      ttt_board_state.board_arr = ["O", "X", "O",
                                   "O", "X", "X",
                                   "X", "O", "O"]
      expect(ttt_rules.game_result(ttt_board_state, "O")).to eq "It's a draw!"
    end

    it 'returns nil if no one won' do
      ttt_board_state.board_arr = ["X", "O", "X",
                                   "O", " ", " ",
                                   "O", "X", "X"]
      expect(ttt_rules.game_over?(ttt_board_state, "X")).to be false
    end
  end

end
