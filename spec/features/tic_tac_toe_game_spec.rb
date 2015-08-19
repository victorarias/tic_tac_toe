require "open3"

describe "Tic-tac-toe game" do
  it "is playable with the computer" do
    run_game
    expect_to_be_asked_to_choose_a_player
    choose_player_x

    expect_to_see_grid(<<-EOS
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

    expect_to_be_asked_for_a_move
    make_move "B2"

    expect_to_see_grid(<<-EOS
    A   B   C
  +---+---+---+
1 | O |   |   |
  +---+---+---+
2 |   | X |   |
  +---+---+---+
3 |   |   |   |
  +---+---+---+
      EOS
    )
  end

  private

  def run_game
    @stdin, @stdout = Open3.popen2("bin/ttt --test-seed")
  end

  def expect_to_be_asked_to_choose_a_player
    expect(@stdout.gets.chomp).to eq("Which player do you want to be? X or O?")
  end

  def choose_player_x
    @stdin.puts "X"
  end

  def expect_to_see_grid(expected_grid)
    grid = 8.times.map { @stdout.gets }.join
    expect(grid).to eq(expected_grid)
  end

  def expect_to_be_asked_for_a_move
    expect(@stdout.gets.chomp).to eq("Where do you want to move?")
  end

  def make_move(move)
    @stdin.puts move
  end
end
