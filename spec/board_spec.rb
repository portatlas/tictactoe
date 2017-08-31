require 'board'

describe Board  do
  let(:board){Board.new}

  describe '#initialize' do
    it "creates an empty board represented by an array of 9 empty strings" do
      expect(board.array).to eq([" ", " ", " ", " ", " ", " ", " ", " ", " "])
    end
  end

end