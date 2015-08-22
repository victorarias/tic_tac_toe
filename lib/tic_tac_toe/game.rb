require "attr_extras"

require "tic_tac_toe/select_marks"
require "tic_tac_toe/board"
require "tic_tac_toe/render_board"
require "tic_tac_toe/position"
require "tic_tac_toe/move"

class TicTacToe
  class Game
    static_facade :run

    def run
      player_mark, computer_mark = SelectMarks.call(self)

      board = Board.empty
      RenderBoard.call(board: board, client: self)

      loop do
        puts "Where do you want to move?"

        board = play(mark: player_mark, with_position: read_position_from_player, board: board)
        notify_win_and_exit(board) if board.won?(player_mark)

        board = play(mark: computer_mark, with_position: select_random_position(board), board: board)
        # TODO: implement loss
        # notify_loss_and_exit(board) if board.won?(computer_mark)

        RenderBoard.call(board: board, client: self)
      end
    end

    def say(message)
      puts message
    end

    def read_player_command
      STDIN.readline.chomp
    end

    private

    def play(mark:, with_position:, board:)
      move = Move.new(position: with_position, mark: mark)
      board.apply_move(move)
    end

    def read_position_from_player
      human_move = read_player_command
      Position.parse(human_move)
    end

    def notify_win_and_exit(board)
      RenderBoard.call(board: board, client: self)

      say("You won, congrats!")
      exit
    end

    def select_random_position(board)
      available_positions = board.available_positions
      available_positions[rand % available_positions.size]
    end
  end
end
