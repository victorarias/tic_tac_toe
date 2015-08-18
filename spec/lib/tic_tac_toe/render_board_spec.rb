require "tic_tac_toe/render_board"
require "tic_tac_toe/board"

describe RenderBoard, "#call" do
  it "renders a board" do
    io = StringIO.new
    RenderBoard.call(board: Board.empty, io: io)

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
end
