require 'board'
require 'tictactoe_board_state'

describe TictactoeBoardState do
  let(:new_board){Board.new}
  let(:ttt_board_state){TictactoeBoardState.new(new_board.array)}
  let(:ttt_board_state_2_moves){TictactoeBoardState.new(new_board.array).move(0).move(1)}
  let(:ttt_board_state_3_moves){TictactoeBoardState.new(new_board.array).move(0).move(1).move(8)}

  describe '#initialize' do
    it 'creates an empty board represented by an array of 9 elements' do
      expect(ttt_board_state.board_arr).to eq([" ", " ", " ", " ", " ", " ", " ", " ", " "])
    end

    it 'board_arr should be an instance of an Array' do
      expect(ttt_board_state.board_arr).to be_instance_of(Array)
    end
  end

  describe '#move' do
    it 'will play X on slot 1' do
      ttt_board_state_1_move = TictactoeBoardState.new(new_board.array).move(0)
      expect(ttt_board_state_1_move.board_arr).to eq(["X", " ", " ", " ", " ", " ", " ", " ", " "])
    end

    it 'will play X on slot 1, and O on slot 2' do
      expect(ttt_board_state_2_moves.board_arr).to eq(["X", "O", " ", " ", " ", " ", " ", " ", " "])
    end

    it 'will play X on slot 1, and O on slot 2, and X on slot 9' do
      expect(ttt_board_state_3_moves.board_arr).to eq(["X", "O", " ", " ", " ", " ", " ", " ", "X"])
    end
  end

  describe ' #valid_slots' do
    it 'returns an array of all the index_positions of the board when the board is empty' do
      expect(ttt_board_state.valid_slots).to eq ([0, 1, 2, 3, 4, 5, 6, 7, 8])
    end

    it 'returns an array of the index_positions where the slots are empty' do
      expect(ttt_board_state_3_moves.valid_slots).to eq([2,3,4,5,6,7])
    end

    it 'returns an empty array when all the slots are taken' do
      full_board = TictactoeBoardState.new(new_board.array).move(0).move(1).move(8).move(2).move(3).move(5).move(4).move(6).move(7)

      expect(full_board.valid_slots).to eq([])
    end
  end

  describe '#switch_turn' do
    it 'returns X when it is Xs turn' do
      expect(ttt_board_state_3_moves.switch_turn("O", "X")).to eq "X"
    end

    it 'returns O when it is Os turn' do
      expect(ttt_board_state_2_moves.switch_turn("O", "X")).to eq "O"
    end
  end

end