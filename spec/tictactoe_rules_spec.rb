require 'tictactoe_board'
require 'tictactoe_rules'

describe TictactoeRules do
  let(:ttt){TictactoeBoard.new}
  let(:ttt_rules){TictactoeRules.new}

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
        ttt.board_arr = ["X", "X", "X",
                         "O", "O", "X",
                         "O", "X", "O"]
        expect(ttt_rules.winning_indices(ttt, "X")).to eq [0,1,2]
      end

      it 'for the second row of the winning combination' do
        ttt.board_arr = ["X", "O", "X",
                         "O", "O", "O",
                         "X", "X", "O"]
        expect(ttt_rules.winning_indices(ttt, "O")).to eq [3,4,5]
      end

      it 'for the bottom row of the winning combination' do
        ttt.board_arr = ["X", "O", "X",
                         "O", "X", "O",
                         "X", "X", "X"]
        expect(ttt_rules.winning_indices(ttt, "X")).to eq [6,7,8]
      end

      it 'for the first column of the winning combination' do
        ttt.board_arr = ["X", "O", "X",
                         "X", "O", "X",
                         "X", "O", "O"]
        expect(ttt_rules.winning_indices(ttt, "X")).to eq [0,3,6]
      end

      it 'for the second column of the winning combination' do
        ttt.board_arr = ["O", "O", "X",
                         "X", "O", "X",
                         "X", "O", "O"]
        expect(ttt_rules.winning_indices(ttt, "O")).to eq [1,4,7]
      end

      it 'for the third column of the winning combination' do
        ttt.board_arr = ["X", "O", "X",
                         "O", "O", "X",
                         "O", "X", "X"]
        expect(ttt_rules.winning_indices(ttt, "X")).to eq [2,5,8]
      end

      it 'for the north west to south east diagonal of the winning combination' do
        ttt.board_arr = ["O", "X", "X",
                         "X", "O", "X",
                         "X", "O", "O"]
        expect(ttt_rules.winning_indices(ttt, "O")).to eq [0,4,8]
      end

      it 'for the north east to south west of the winning combination' do
        ttt.board_arr = ["X", "O", "X",
                        "O", "X", "X",
                        "X", "O", "O"]
        expect(ttt_rules.winning_indices(ttt, "X")).to eq [2,4,6]
      end
    end

    context 'returns nil' do
      it 'if there is no winning combination' do
        ttt.board_arr = ["X", "O", "X",
                        "X", "O", "O",
                        "O", "X", "O"]
        expect(ttt_rules.winning_indices(ttt, "X")).to eq nil
      end

      it 'if there is an open slot' do
        ttt.board_arr = ["X", "O", "X",
                         "X", " ", "O",
                         "O", "X", "O"]
        expect(ttt_rules.winning_indices(ttt, "X")).to eq nil
      end
    end
  end

  describe '#won?' do
    it 'returns false if no one wins and the board is full' do
        ttt.board_arr = ["X", "O", "X",
                         "X", "O", "O",
                         "O", "X", "O"]
        expect(ttt_rules.won?(ttt, "X")).to eq false
    end

    it 'returns false if no one wins and the board is empty' do
        ttt.board_arr = [" ", " ", " ",
                         " ", " ", " ",
                         " ", " ", " "]
        expect(ttt_rules.won?(ttt, "X")).to eq false
    end

    it 'returns true if there is a winner' do
        ttt.board_arr = ["X", "O", "X",
                         "X", "O", " ",
                         "O", "O", "O"]
        expect(ttt_rules.won?(ttt, "O")).to eq true
    end
  end

  describe '#draw?' do
    it 'returns true if no one wins and the board is full' do
        ttt.board_arr = ["X", "O", "X",
                         "X", "O", "O",
                         "O", "X", "O"]
        expect(ttt_rules.draw?(ttt, "X")).to eq true
    end

    it 'returns false if the board has open slots' do
        ttt.board_arr = ["X", "O", "X",
                         "X", "O", " ",
                         "O", "X", "O"]
        expect(ttt_rules.draw?(ttt, "O")).to eq false
    end
  end

  describe ' #game_over?' do
    it 'returns true if someone won' do
      ttt.board_arr = ["X", "O", "X",
                       "O", "X", "X",
                       "O", "X", "X"]
      expect(ttt_rules.game_over?(ttt, ttt.turn)).to eq true
    end

    it 'returns true if there is a tie' do
      ttt.board_arr = ["X", "O", "X",
                       "X", "O", "O",
                       "O", "X", "O"]
      expect(ttt_rules.game_over?(ttt, ttt.turn)).to eq true
    end

    it 'returns false if there is an open slot' do
      ttt.board_arr = ["X", "O", "X",
                       "O", " ", " ",
                       "O", "X", "X"]
      expect(ttt_rules.game_over?(ttt, ttt.turn)).to eq false
    end
  end

  describe ' #winner' do
      it 'returns X if X is the winner' do
        ttt.board_arr = ["X", "O", "X",
                         "O", "X", "X",
                         "X", "O", "O"]
        expect(ttt_rules.winner(ttt, "X")).to eq "X"
      end

      it 'returns O if O is the winner' do
        ttt.board_arr = ["X", "O", "X",
                         "O", "O", "X",
                         "X", "O", "O"]
        expect(ttt_rules.winner(ttt, "O")).to eq "O"
      end

      it 'return nil if there is no winner' do
        ttt.board_arr = ["X", "O", "X",
                         "O", "X", "X",
                         "X", "O", "O"]
        expect(ttt_rules.winner(ttt, "O")).to eq nil
      end

      it 'returns nil if there is no winner' do
        ttt.board_arr = ["X", "O", "X",
                         "O", " ", "X",
                         "X", "O", "O"]
        expect(ttt_rules.winner(ttt, "O")).to eq nil
      end
  end

end