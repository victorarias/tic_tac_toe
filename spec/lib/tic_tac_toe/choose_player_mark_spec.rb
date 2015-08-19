require "tic_tac_toe/choose_player_mark"

describe TicTacToe::ChoosePlayerMark, "#call" do
  it "asks the player to choose a mark" do
    client = build_client

    expect(client).to receive(:say).with("Which player do you want to be? X or O?")

    TicTacToe::ChoosePlayerMark.call(client: client)
  end

  it "returns XMark when the player command is X" do
    client = build_client
    allow(client).to receive(:read_player_command).and_return("X")

    actual = TicTacToe::ChoosePlayerMark.call(client: client)

    expect(actual).to eq(XMark)
  end

  it "returns OMark when the player command is O" do
    client = build_client
    allow(client).to receive(:read_player_command).and_return("O")

    actual = TicTacToe::ChoosePlayerMark.call(client: client)

    expect(actual).to eq(OMark)
  end

  it "keeps asking if the player command is not X or O" do
    client = build_client
    invalid_try_again_message = "The mark you selected is invalid. Try again: X or O?"

    allow(client).to receive(:read_player_command).and_return("A", "", "X")
    allow(client).to receive(:say).once.ordered.with("Which player do you want to be? X or O?")

    expect(client).to receive(:say).twice.with(invalid_try_again_message)

    actual = TicTacToe::ChoosePlayerMark.call(client: client)

    expect(actual).to eq(XMark)
  end

  private

  def build_client
    double(:client).tap { |client|
      allow(client).to receive(:say)
      allow(client).to receive(:read_player_command).and_return("X")
    }
  end
end
