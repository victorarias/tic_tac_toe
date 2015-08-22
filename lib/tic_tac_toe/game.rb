require "attr_extras"

require "tic_tac_toe/select_marks"
require "tic_tac_toe/board"
require "tic_tac_toe/render_board"
require "tic_tac_toe/move"

require "tic_tac_toe/player"
require "tic_tac_toe/computer"

class TicTacToe
  class Game
    static_facade :run
    attr_private :mark_to_player

    def run
      assign_marks(*SelectMarks.call(self))

      board = Board.empty
      RenderBoard.call(board: board, client: self)

      loop do
        board = play(mark: XMark, with_position: x_mark_player.select_position_for_move(board), board: board)
        RenderBoard.call(board: board, client: self)

        notify_win_and_exit(XMark, board) if board.won?(XMark)

        board = play(mark: OMark, with_position: o_mark_player.select_position_for_move(board), board: board)
        RenderBoard.call(board: board, client: self)

        notify_win_and_exit(OMark, board) if board.won?(OMark)
      end
    end

    def say(message)
      puts message
    end

    def read_player_command
      STDIN.readline.chomp
    end

    private

    def assign_marks(player_mark, computer_mark)
      player = Player.new(self)
      computer = Computer.new

      player_to_mark = {
        player => player_mark,
        computer => computer_mark,
      }

      @mark_to_player = player_to_mark.to_a.map { |player_and_mark| player_and_mark.reverse }.to_h
    end

    def x_mark_player
      mark_to_player[XMark]
    end

    def o_mark_player
      mark_to_player[OMark]
    end

    def play(mark:, with_position:, board:)
      move = Move.new(position: with_position, mark: mark)
      board.apply_move(move)
    end

    def notify_win_and_exit(mark, board)
      say("#{mark.to_s} won, cheers!")
      exit
    end
  end
end
