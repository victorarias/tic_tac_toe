require "attr_extras"

require "tic_tac_toe/choose_player_mark"
require "tic_tac_toe/board"
require "tic_tac_toe/render_board"
require "tic_tac_toe/position"
require "tic_tac_toe/move"

class TicTacToeGame
  static_facade :run

  def run
    player = TicTacToe::ChoosePlayerMark.call(client: self)

    board = TicTacToe::Board.empty
    TicTacToe::RenderBoard.call(board: board, io: STDOUT)

    puts "Where do you want to move?"

    move = read_move_from_player(player)
    board = board.apply_move(move)

    TicTacToe::RenderBoard.call(board: board, io: STDOUT)
  end

  def say(message)
    puts message
  end

  def read_player_command
    readline.chomp
  end

  private

  def read_move_from_player(player)
    human_move = readline.chomp
    position = TicTacToe::Position.parse(human_move)
    TicTacToe::Move.new(position: position, mark: player)
  end
end
