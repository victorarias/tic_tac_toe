require "tic_tac_toe/select_marks"

describe TicTacToe::SelectMarks, "#call" do
  it "selects X for player and O for computer when the player selects X" do
    allow(TicTacToe::ChoosePlayerMark).to receive(:call).with(client).and_return(XMark)

    player_mark, computer_mark = TicTacToe::SelectMarks.call(client)

    expect(player_mark).to eq(XMark)
    expect(computer_mark).to eq(OMark)
  end

  it "selects O for player and X for computer when the player selects O" do
    allow(TicTacToe::ChoosePlayerMark).to receive(:call).with(client).and_return(OMark)

    player_mark, computer_mark = TicTacToe::SelectMarks.call(client)

    expect(player_mark).to eq(OMark)
    expect(computer_mark).to eq(XMark)
  end

  private

  def client
    @client ||= double
  end
end
