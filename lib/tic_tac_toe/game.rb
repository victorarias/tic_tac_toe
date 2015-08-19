require "attr_extras"

require "tic_tac_toe/choose_player_mark"
require "tic_tac_toe/board"
require "tic_tac_toe/render_board"
require "tic_tac_toe/position"
require "tic_tac_toe/move"

class TicTacToe
  class Game
    static_facade :run

    def run
      player_mark = ChoosePlayerMark.call(client: self)
      computer_mark = select_computer_mark(player_mark)

      board = Board.empty
      RenderBoard.call(board: board, client: self)

      puts "Where do you want to move?"

      position = read_position_from_player
      move = Move.new(position: position, mark: player_mark)
      board = board.apply_move(move)

      position = select_random_position(board)
      move = Move.new(position: position, mark: computer_mark)
      board = board.apply_move(move)

      RenderBoard.call(board: board, client: self)
    end

    def say(message)
      puts message
    end

    def read_player_command
      STDIN.readline.chomp
    end

    private

    def select_computer_mark(player_mark)
      [ XMark, OMark ].reject { |mark| mark == player_mark }.first
    end

    def read_position_from_player
      human_move = read_player_command
      Position.parse(human_move)
    end

    def select_random_position(board)
      available_positions = board.available_positions
      available_positions[rand % available_positions.size]
    end
  end
end
