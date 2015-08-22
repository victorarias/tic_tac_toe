require "tic_tac_toe/marks"

module TicTacToe
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

    def won?(mark)
      any_win_sequence?(lines, mark) ||
        any_win_sequence?(columns, mark) ||
        any_win_sequence?(diagonals, mark)
    end

    private

    def any_win_sequence?(list, mark)
      list.any? { |sequence| sequence.all? { |current_mark| mark == current_mark } }
    end

    def columns
      number_of_columns = lines.first.size
      number_of_columns.times.map { |column|
        lines.map { |line| line[column] }
      }
    end

    def diagonals
      [
        [ lines[0][0], lines[1][1], lines[2][2] ],
        [ lines[0][2], lines[1][1], lines[2][0] ],
      ]
    end
  end
end
