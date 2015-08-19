require "tic_tac_toe/marks"

class TicTacToe
  class Board
    vattr_initialize :lines

    def self.empty
      Board.new(
        [
          [ NoMark, NoMark, NoMark ],
          [ NoMark, NoMark, NoMark ],
          [ NoMark, NoMark, NoMark ],
        ]
      )
    end

    def apply_move(move)
      Board.new(move.applied_to(lines))
    end

    def available_positions
      lines.each_with_index.map { |columns, line_number|
        columns
          .each_with_index
          .select { |mark, _| mark == NoMark }
          .map { |mark, column_number| TicTacToe::Position.new(column_number, line_number) }
      }.flatten
    end
  end
end
