require "tic_tac_toe/board"

# In this case, it's better to depend on simple models than use doubles for testing
require "tic_tac_toe/position"
require "tic_tac_toe/move"

describe TicTacToe::Board, "#apply_move" do
  it "returns a board with the move applied" do
    board = TicTacToe::Board.empty
    position = TicTacToe::Position.new(1, 1)
    move = TicTacToe::Move.new(position: position, mark: XMark)

    new_board = board.apply_move(move)

    expect(new_board.lines).to eq([
      [ NoMark, NoMark, NoMark ],
      [ NoMark, XMark,  NoMark ],
      [ NoMark, NoMark, NoMark ],
    ])
  end
end

describe TicTacToe::Board, "#available_positions" do
  it "returns positions with no mark" do
    board = TicTacToe::Board.new([
      [ NoMark, XMark, XMark ],
      [ XMark, NoMark, XMark ],
      [ XMark, XMark, NoMark ],
    ])

    expect(board.available_positions).to eq([
      TicTacToe::Position.new(0, 0),
      TicTacToe::Position.new(1, 1),
      TicTacToe::Position.new(2, 2),
    ])
  end
end

describe TicTacToe::Board, "#won?" do
  it "returns true when the given mark is present on one line" do
    board = TicTacToe::Board.new([
      [ XMark, OMark, OMark ],
      [ XMark, XMark, XMark ],
      [ OMark, XMark, XMark ],
    ])

    expect(board.won?(XMark)).to eq(true)
    expect(board.won?(OMark)).to eq(false)
  end

  it "returns true when the given mark is present on one column" do
    board = TicTacToe::Board.new([
      [ XMark, OMark, XMark ],
      [ OMark, XMark, XMark ],
      [ OMark, XMark, XMark ],
    ])

    expect(board.won?(XMark)).to eq(true)
    expect(board.won?(OMark)).to eq(false)
  end

  it "returns true when the given mark is present on one of the diagonals" do
    board = TicTacToe::Board.new([
      [ XMark, OMark, OMark ],
      [ OMark, XMark, OMark ],
      [ OMark, OMark, XMark ],
    ])

    expect(board.won?(XMark)).to eq(true)
    expect(board.won?(OMark)).to eq(false)

    board = TicTacToe::Board.new([
      [ XMark, XMark, OMark ],
      [ XMark, OMark, XMark ],
      [ OMark, XMark, XMark ],
    ])

    expect(board.won?(XMark)).to eq(false)
    expect(board.won?(OMark)).to eq(true)
  end
end
