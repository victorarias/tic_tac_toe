class TicTacToe
  class Move
    pattr_initialize [ :position, :mark ]

    def applied_to(board_lines)
      board_lines.each_with_index.map { |line, line_number|
        line = line.dup

        if line_number == position.y
          line[position.x] = mark
        end

        line
      }
    end
  end
end
