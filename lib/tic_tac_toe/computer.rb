class TicTacToe
  class Computer
    vattr_initialize :mark

    def select_mark(board)
      available_positions = board.available_positions
      available_positions[rand % available_positions.size]
    end
  end
end
