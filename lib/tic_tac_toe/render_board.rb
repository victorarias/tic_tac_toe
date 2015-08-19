class TicTacToe
  class RenderBoard
    method_object [ :board, :io ]

    def call
      render_header
      render_division_line

      board.lines.each_with_index do |line, line_number|
        render_line(line_number, line)
        render_division_line
      end
    end

    private

    def render_header
      io.puts("    A   B   C")
    end

    def render_division_line
      io.puts("  +---+---+---+")
    end

    def render_line(line_number, contents)
      io.puts("#{line_number + 1} | #{contents[0]} | #{contents[1]} | #{contents[2]} |")
    end
  end
end
