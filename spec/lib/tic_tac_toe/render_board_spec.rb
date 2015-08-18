require "tic_tac_toe/render_board"

describe RenderBoard, "#call" do
  it "renders a board" do
    board = double
    io = StringIO.new
    RenderBoard.call(io: io)

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
