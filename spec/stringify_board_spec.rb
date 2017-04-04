require 'stringify_board'

describe StringifyBoard do
  let(:stringify_board){StringifyBoard.new}

  describe '#board_to_grid' do
    it 'puts to the screen a tic tac toe board' do
      board = ["O", "O", "X",
               "X", "O", "X",
               "X", "O", "O"]

      output = capture_puts{stringify_board.board_to_grid(board)}

      expect(output).to include("-------------")
      expect(output).to include("| O | O | X |")
      expect(output).to include("-------------")
      expect(output).to include("| X | O | X |")
      expect(output).to include("-------------")
      expect(output).to include("| X | O | O |")
      expect(output).to include("-------------")
    end
  end
end