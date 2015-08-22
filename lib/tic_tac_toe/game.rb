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

    def run
      player_mark, computer_mark = SelectMarks.call(self)

      board = Board.empty
      RenderBoard.call(board: board, client: self)

      loop do
        player = Player.new(self)
        board = play(mark: player_mark, with_position: player.select_position_for_move(board), board: board)
        notify_win_and_exit(board) if board.won?(player_mark)

        computer = Computer.new
        board = play(mark: computer_mark, with_position: computer.select_position_for_move(board), board: board)
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

    def notify_win_and_exit(board)
      RenderBoard.call(board: board, client: self)

      say("You won, congrats!")
      exit
    end
  end
end
