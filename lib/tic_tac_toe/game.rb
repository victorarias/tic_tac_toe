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
      player = ChoosePlayerMark.call(client: self)
      computer_mark = [ XMark, OMark ].reject { |mark| mark == player }.first

      board = Board.empty
      RenderBoard.call(board: board, io: STDOUT)

      puts "Where do you want to move?"

      move = read_move_from_player(player)
      board = board.apply_move(move)

      move = make_random_move_on(board, computer_mark)
      board = board.apply_move(move)

      RenderBoard.call(board: board, io: STDOUT)
    end

    def say(message)
      puts message
    end

    def read_player_command
      STDIN.readline.chomp
    end

    private

    def make_random_move_on(board, mark)
      available_positions = board.available_positions
      random_position = available_positions[rand % available_positions.size]
      Move.new(position: random_position, mark: mark)
    end

    def read_move_from_player(player)
      human_move = read_player_command
      position = Position.parse(human_move)
      Move.new(position: position, mark: player)
    end
  end
end