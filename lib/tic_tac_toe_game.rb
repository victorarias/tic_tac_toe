require "attr_extras"
require "tic_tac_toe/board"
require "tic_tac_toe/render_board"

class TicTacToeGame
  static_facade :run

  def run
    puts "Which player do you want to be? X or O?"
    player = readline.chomp

    RenderBoard.call(board: Board.empty, io: STDOUT)

    puts "Where do you want to move?"
  end
end
