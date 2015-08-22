class TicTacToe
  class Computer
    def select_mark(board)
      available_positions = board.available_positions
      available_positions[rand % available_positions.size]
    end
  end
end
