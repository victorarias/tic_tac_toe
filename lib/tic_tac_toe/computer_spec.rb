require "tic_tac_toe/computer"

describe TicTacToe::Computer, "#select_mark" do
  it "randomly selects an available position from the board" do
    random_numbers = [ 0, 1 ]
    random_number_generator = Proc.new { |max|
      raise "unexpected max number" if max != 2
      random_numbers.shift
    }
    computer = TicTacToe::Computer.new(random_number_generator: random_number_generator)

    available_positions = [
      position_1 = double(:position_1),
      position_2 = double(:position_2),
    ]
    board = double(:board, available_positions: available_positions)

    selected_mark = computer.select_mark(board)
    expect(selected_mark).to eq(position_1)

    selected_mark = computer.select_mark(board)
    expect(selected_mark).to eq(position_2)
  end
end
