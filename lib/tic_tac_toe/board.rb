require "tic_tac_toe/marks"

class TicTacToe
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
  end
end
