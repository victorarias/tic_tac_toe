class TicTacToe
  class Computer
    pattr_initialize [ :random_number_generator ]

    def select_position_for_move(board)
      available_positions = board.available_positions
      random_number = random_number_generator.call(available_positions.size)
      available_positions[random_number]
    end

    private

    def random_number_generator
      @random_number_generator ||= Proc.new { |max|
        rand % max
      }
    end
  end
end
