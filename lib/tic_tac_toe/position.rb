module TicTacToe
  class Position
    COLUMN_TO_NUMBER = {
      "A" => 0,
      "B" => 1,
      "C" => 2,
    }

    vattr_initialize :x, :y

    def self.parse(human_position)
      column = human_position[0]
      row = Integer(human_position[1])

      Position.new(COLUMN_TO_NUMBER[column], row - 1)
    end
  end
end
