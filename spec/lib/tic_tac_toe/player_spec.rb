require "tic_tac_toe/player"

describe TicTacToe::Player, "#select_position_for_move(board)" do
  it "asks the player to make a move" do
    client = build_client

    expect(client).to receive(:say).with("Where do you want to move?")

    player = TicTacToe::Player.new(client)
    player.select_position_for_move(nil)
  end

  it "reads the player command and returns a position" do
    client = build_client
    player_input = "B2"
    player = TicTacToe::Player.new(client)

    allow(client).to receive(:read_player_command).and_return(player_input)


    expected_position = TicTacToe::Position.parse(player_input)
    expect(player.select_position_for_move(nil)).to eq(expected_position)
  end

  private

  def build_client
    double(:client).tap do |client|
      allow(client).to receive(:read_player_command).and_return("A1")
      allow(client).to receive(:say)
    end
  end
end
