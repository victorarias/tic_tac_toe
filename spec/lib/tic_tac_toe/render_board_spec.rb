require "tic_tac_toe/render_board"

require "tic_tac_toe/board"

describe TicTacToe::RenderBoard, "#call" do
  class TestClient
    vattr_initialize :io

    def say(message)
      io.puts(message)
    end
  end

  it "renders an empty board" do
    io = StringIO.new
    TicTacToe::RenderBoard.call(board: TicTacToe::Board.empty, client: TestClient.new(io))

    expect(io.string).to eq(<<-EOS
    A   B   C
  +---+---+---+
1 |   |   |   |
  +---+---+---+
2 |   |   |   |
  +---+---+---+
3 |   |   |   |
  +---+---+---+
      EOS
    )
  end

  it "renders an non-empty board" do
    io = StringIO.new
    board = TicTacToe::Board.new([
      [ OMark, NoMark, XMark ],
      [ XMark, OMark, XMark ],
      [ XMark, NoMark, OMark ],
    ])
    TicTacToe::RenderBoard.call(board: board, client: TestClient.new(io))

    expect(io.string).to eq(<<-EOS
    A   B   C
  +---+---+---+
1 | O |   | X |
  +---+---+---+
2 | X | O | X |
  +---+---+---+
3 | X |   | O |
  +---+---+---+
      EOS
    )
  end
end
