require_relative '../lib/tic_tac_toe.rb'

describe TicTacToe do
  let(:ttt){TicTacToe.new}

  describe '#initialize' do
    it 'creates a empty board represented by an array of 9 slots' do
      expect(ttt.board).to eq([" ", " ", " ", " ", " ", " ", " ", " ", " "])
    end
  end

  describe '#move' do
    it 'will play the X symbol on to the first slot of the board given the index position 1' do
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

  describe '#valid_slots' do
    it 'returns an array of all the index_positions of the board when the board is empty' do
      expect(ttt.valid_slots).to eq ([0, 1, 2, 3, 4, 5, 6, 7, 8])
    end

    it 'returns an array of the index_positions where the slots are empty' do
      ttt = TicTacToe.new.move(0).move(1).move(8)

      played_board = ttt.board
      expect(ttt.valid_slots).to eq([2,3,4,5,6,7])
    end

    it 'returns an empty array when all the slots are taken' do
      full_board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
      ttt.board = full_board
      expect(ttt.valid_slots).to eq([])
    end
  end

  describe '#valid_move?' do
    it 'returns true if the move is made on an empty board' do
      expect(ttt.valid_move?(1)).to eq true
    end

    it 'returns true if the move is made on a valid_slot' do
      played_board = ["X", "O", "X", "O", "X", "X", " ", "X", "O"]
      ttt.board = played_board
      expect(ttt.valid_move?(6)).to eq true
    end

    it 'returns false if the move is out of range' do
      expect(ttt.valid_move?(100)).to eq false
    end

    it 'returns false if the move is made on a slot that is taken' do
      ttt = TicTacToe.new.move(1)
      expect(ttt.valid_move?(1)).to eq false
    end
  end

  describe '#whose_turn' do
    it 'returns the X for the most recent turn that went' do
      ttt = TicTacToe.new.move(0).move(1).move(8)
      expect(ttt.whose_turn("O", "X")).to eq "X"
    end

    it 'returns the symbol O for the most recent turn that went' do
      ttt = TicTacToe.new.move(0).move(1)
      expect(ttt.whose_turn("O", "X")).to eq "O"
    end
  end

  describe 'WIN_COMBOS' do
    it 'is a nested array made up of 8 possible combinations of index positions of winning in tac toe' do
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
        ttt.board = ["X", "X", "X", "O", "X", "X", "O", "X", "O"]
        expect(ttt.won?).to eq [0,1,2]
      end

      it 'for the second row of the winning combination' do
        ttt.board = ["X", "O", "X", "O", "O", "O", "X", "X", "O"]
        expect(ttt.won?).to eq [3,4,5]
      end

      it 'for the bottom row of the winning combination' do
        ttt.board = ["X", "O", "X", "O", "X", "O", "X", "X", "X"]
        expect(ttt.won?).to eq [6,7,8]
      end

      it 'for the first column of the winning combination' do
        ttt.board = ["X", "O", "X", "X", "O", "X", "X", "O", "O"]
        expect(ttt.won?).to eq [0,3,6]
      end

      it 'for the second column of the winning combination' do
        ttt.board = ["O", "O", "X", "X", "O", "X", "X", "O", "O"]
        expect(ttt.won?).to eq [1,4,7]
      end

      it 'for the third column of the winning combination' do
        ttt.board = ["X", "O", "X", "O", "X", "X", "O", "X", "X"]
        expect(ttt.won?).to eq [2,5,8]
      end

      it 'for the north west to south east diagonal of the winning combination' do
        ttt.board = ["O", "X", "X", "X", "O", "X", "X", "O", "O"]
        expect(ttt.won?).to eq [0,4,8]
      end

      it 'for the north east to south west of the winning combination' do
        ttt.board = ["X", "O", "X", "O", "X", "X", "X", "O", "O"]
        expect(ttt.won?).to eq [2,4,6]
      end
    end

    context 'returns nil' do
      it 'if there is no winning combination' do
        ttt.board = ["X", "O", "X", "X", "O", "O", "O", "X", "O"]
        expect(ttt.won?).to eq nil
      end

      it 'if there is an open slot' do
        ttt.board = ["X", "O", "X", "X", " ", "O", "O", "X", "O"]
        expect(ttt.won?).to eq nil
      end
    end
  end

  describe '#draw?' do
    it 'returns true if no one wins and the board is full' do
        ttt.board = ["X", "O", "X", "X", "O", "O", "O", "X", "O"]
        expect(ttt.draw?).to eq true
    end

    it 'returns false if the board has open slots' do
        ttt.board = ["X", "O", "X", "X", "O", " ", "O", "X", "O"]
        expect(ttt.draw?).to eq false
    end
  end

  describe '#game_over?' do
    it 'returns true if someone won' do
      ttt.board = ["X", "O", "X", "O", "X", "X", "O", "X", "X"]
      expect(ttt.game_over?).to eq true
    end

    it 'returns true if there is a tie' do
      ttt.board = ["X", "O", "X", "X", "O", "O", "O", "X", "O"]
      expect(ttt.game_over?).to eq true
    end

    it 'returns false if there is an open slot' do
      ttt.board = ["X", "O", "X", "O", "X", " ", "O", "X", "X"]
      expect(ttt.game_over?).to eq true
    end
  end

  describe '#winner' do
    it 'returns the X as the winner' do
      ttt.board = ["X", "X", "X", "O", "X", "X", "O", "X", "O"]
      expect(ttt.winner).to eq "X"
    end

    it 'returns the O as the winner' do
      ttt.board = ["O", "O", "X", "X", "O", "X", "X", "O", "O"]
      expect(ttt.winner).to eq "O"
    end

      it 'returns the nil if there is no winner' do
      ttt.board = ["X", "O", "X", "X", "O", "O", "O", "X", "O"]
      expect(ttt.winner).to eq nil
    end

  end


end