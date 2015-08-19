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
