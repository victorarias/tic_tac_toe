require "open3"

describe "Tic-tac-toe game" do
  it "is playable with the computer" do
    run_game
    expect_to_be_asked_to_choose_a_player
    choose_player_x

    # temp
    expect(@stdout.gets.chomp).to eq("You've chosen X.")
  end

  private

  def run_game
    @stdin, @stdout = Open3.popen2("bin/ttt")
  end

  def expect_to_be_asked_to_choose_a_player
    expect(@stdout.gets.chomp).to eq("Which player do you want to be? X or O?")
  end

  def choose_player_x
    @stdin.puts "X"
  end
end
