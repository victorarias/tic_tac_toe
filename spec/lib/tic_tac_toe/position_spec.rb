require "tic_tac_toe/position"

describe TicTacToe::Position, ".parse" do
  it "parses from human format" do
    expect(parse("A1")).to eq(position(0, 0))
    expect(parse("B1")).to eq(position(1, 0))
    expect(parse("C1")).to eq(position(2, 0))

    expect(parse("A2")).to eq(position(0, 1))
    expect(parse("B2")).to eq(position(1, 1))
    expect(parse("C2")).to eq(position(2, 1))

    expect(parse("A3")).to eq(position(0, 2))
    expect(parse("B3")).to eq(position(1, 2))
    expect(parse("C3")).to eq(position(2, 2))
  end

  private

  def parse(human_position)
    TicTacToe::Position.parse(human_position)
  end

  def position(x, y)
    TicTacToe::Position.new(x, y)
  end
end
