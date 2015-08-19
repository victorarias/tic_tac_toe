require "tic_tac_toe/move"

require "tic_tac_toe/position"

describe TicTacToe::Move, "#applied_to" do
  let(:new_mark) { double(:new_mark) }
  let(:another_mark) { double(:another_mark) }

  it "applies to 0,0" do
    position = TicTacToe::Position.new(0, 0)
    move = TicTacToe::Move.new(position: position, mark: new_mark)

    apply(move, to: [
      [ another_mark, another_mark, another_mark ],
      [ another_mark, another_mark, another_mark ],
      [ another_mark, another_mark, another_mark ],
    ], expect: [
      [ new_mark, another_mark, another_mark ],
      [ another_mark, another_mark, another_mark ],
      [ another_mark, another_mark, another_mark ],
    ])
  end

  it "applies to 1, 1" do
    position = TicTacToe::Position.new(1, 1)
    move = TicTacToe::Move.new(position: position, mark: new_mark)

    apply(move, to: [
      [ another_mark, another_mark, another_mark ],
      [ another_mark, another_mark, another_mark ],
      [ another_mark, another_mark, another_mark ],
    ], expect: [
      [ another_mark, another_mark, another_mark ],
      [ another_mark, new_mark,     another_mark ],
      [ another_mark, another_mark, another_mark ],
    ])
  end

  it "applies to 2, 2" do
    position = TicTacToe::Position.new(2, 2)
    move = TicTacToe::Move.new(position: position, mark: new_mark)

    apply(move, to: [
      [ another_mark, another_mark, another_mark ],
      [ another_mark, another_mark, another_mark ],
      [ another_mark, another_mark, another_mark ],
    ], expect: [
      [ another_mark, another_mark, another_mark ],
      [ another_mark, another_mark, another_mark ],
      [ another_mark, another_mark, new_mark ],
    ])
  end

  private

  def apply(move, to:, expect:)
    actual = move.applied_to(to)
    expect(actual).to eq(expect)
  end
end
