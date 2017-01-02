require 'tictactoe'

describe TicTacToe do
  let(:ttt){TicTacToe.new}

  describe '#initialize' do
    it 'creates a empty board represented by an array of 9 elements' do
      expect(ttt.board).to eq([" ", " ", " ", " ", " ", " ", " ", " ", " "])
    end
  end

  describe '#move' do
    it 'will play X on slot 1' do
      ttt = TicTacToe.new.move(0)
      expect(ttt.board).to eq(["X", " ", " ", " ", " ", " ", " ", " ", " "])
    end

    it 'will play X on slot 1, and O on slot 2' do
      ttt = TicTacToe.new.move(0).move(1)
      expect(ttt.board).to eq(["X", "O", " ", " ", " ", " ", " ", " ", " "])
    end

    it 'will play X on slot 1, and O on slot 2, and X on slot 9' do
      ttt = TicTacToe.new.move(0).move(1).move(8)
      played_board = ttt.board
      expect(played_board).to eq(["X", "O", " ", " ", " ", " ", " ", " ", "X"])
    end
  end

  describe ' #valid_slots' do
    it 'returns an array of all the index_positions of the board when the board is empty' do
      expect(ttt.valid_slots).to eq ([0, 1, 2, 3, 4, 5, 6, 7, 8])
    end

    it 'returns an array of the index_positions where the slots are empty' do
      played_board = TicTacToe.new.move(0).move(1).move(8)

      expect(played_board.valid_slots).to eq([2,3,4,5,6,7])
    end

    it 'returns an empty array when all the slots are taken' do
      full_board = TicTacToe.new.move(0).move(1).move(8).move(2).move(3).move(5).move(4).move(6).move(7)

      expect(full_board.valid_slots).to eq([])
    end
  end

  describe '#whose_turn' do
    it 'returns X when it is Xs turn' do
      ttt = TicTacToe.new.move(0).move(1).move(8)
      expect(ttt.whose_turn("O", "X")).to eq "X"
    end

    it 'returns O when it is Os turn' do
      ttt = TicTacToe.new.move(0).move(1)
      expect(ttt.whose_turn("O", "X")).to eq "O"
    end
  end

  describe 'WIN_COMBOS' do
    it 'is a nested array made up of 8 possible combinations of winning index positions' do
      expect(TicTacToe::WIN_COMBOS.length).to eq 8
    end

    it 'provides the right combinations for row wins' do
      expect(TicTacToe::WIN_COMBOS).to include([0,1,2] && [3,4,5] && [6,7,8])
    end

    it 'provides the right combinations for column wins' do
      expect(TicTacToe::WIN_COMBOS).to include([0,3,6] && [1,4,7] && [2,5,8])
    end

    it 'provides the right combinations for diagnal wins' do
      expect(TicTacToe::WIN_COMBOS).to include([0,4,8] && [2,4,6])
    end
  end

  describe '#won?' do
    context 'returns the winning indices' do
      it 'for the top row of the winning combination' do
        ttt.board = ["X", "X", "X",
                     "O", "O", "X",
                     "O", "X", "O"]
        expect(ttt.won?("X")).to eq [0,1,2]
      end

      it 'for the second row of the winning combination' do
        ttt.board = ["X", "O", "X",
                     "O", "O", "O",
                     "X", "X", "O"]
        expect(ttt.won?("O")).to eq [3,4,5]
      end

      it 'for the bottom row of the winning combination' do
        ttt.board = ["X", "O", "X",
                     "O", "X", "O",
                     "X", "X", "X"]
        expect(ttt.won?("X")).to eq [6,7,8]
      end

      it 'for the first column of the winning combination' do
        ttt.board = ["X", "O", "X",
                     "X", "O", "X",
                     "X", "O", "O"]
        expect(ttt.won?("X")).to eq [0,3,6]
      end

      it 'for the second column of the winning combination' do
        ttt.board = ["O", "O", "X",
                     "X", "O", "X",
                     "X", "O", "O"]
        expect(ttt.won?("O")).to eq [1,4,7]
      end

      it 'for the third column of the winning combination' do
        ttt.board = ["X", "O", "X",
                     "O", "O", "X",
                     "O", "X", "X"]
        expect(ttt.won?("X")).to eq [2,5,8]
      end

      it 'for the north west to south east diagonal of the winning combination' do
        ttt.board = ["O", "X", "X",
                     "X", "O", "X",
                     "X", "O", "O"]
        expect(ttt.won?("O")).to eq [0,4,8]
      end

      it 'for the north east to south west of the winning combination' do
        ttt.board = ["X", "O", "X",
                     "O", "X", "X",
                     "X", "O", "O"]
        expect(ttt.won?("X")).to eq [2,4,6]
      end
    end

    context 'returns nil' do
      it 'if there is no winning combination' do
        ttt.board = ["X", "O", "X",
                     "X", "O", "O",
                     "O", "X", "O"]
        expect(ttt.won?("X")).to eq nil
      end

      it 'if there is an open slot' do
        ttt.board = ["X", "O", "X",
                     "X", " ", "O",
                     "O", "X", "O"]
        expect(ttt.won?("X")).to eq nil
      end
    end
  end

  describe '#draw?' do
    it 'returns true if no one wins and the board is full' do
        ttt.board = ["X", "O", "X",
                     "X", "O", "O",
                     "O", "X", "O"]
        expect(ttt.draw?).to eq true
    end

    it 'returns false if the board has open slots' do
        ttt.board = ["X", "O", "X",
                      "X", "O", " ",
                      "O", "X", "O"]
        expect(ttt.draw?).to eq false
    end
  end

  describe ' #game_over?' do
    it 'returns true if someone won' do
      ttt.board = ["X", "O", "X",
                   "O", "X", "X",
                   "O", "X", "X"]
      expect(ttt.game_over?).to eq true
    end

    it 'returns true if there is a tie' do
      ttt.board = ["X", "O", "X",
                   "X", "O", "O",
                   "O", "X", "O"]
      expect(ttt.game_over?).to eq true
    end

    it 'returns false if there is an open slot' do
      ttt.board = ["X", "O", "X",
                   "O", " ", " ",
                   "O", "X", "X"]
      expect(ttt.game_over?).to eq false
    end
  end

end