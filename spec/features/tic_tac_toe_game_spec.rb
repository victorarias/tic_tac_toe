require "open3"

describe "Tic-tac-toe game" do
  before do
    run_game
  end

  it "is winnable as X against the computer" do
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

    expect_to_be_asked_for_a_move
    make_move "B1"

    expect_to_see_grid(<<-EOS
    A   B   C
  +---+---+---+
1 | O | X | O |
  +---+---+---+
2 |   | X |   |
  +---+---+---+
3 |   |   |   |
  +---+---+---+
      EOS
    )

    expect_to_be_asked_for_a_move
    make_move "B3"

    expect_to_see_grid(<<-EOS
    A   B   C
  +---+---+---+
1 | O | X | O |
  +---+---+---+
2 |   | X |   |
  +---+---+---+
3 |   | X |   |
  +---+---+---+
      EOS
    )

    expect_to_win
    wait_thread_to_exit
  end

  it "is winnable as O against the computer" do
    expect_to_be_asked_to_choose_a_player
    choose_player_o

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
  end

  private

  def run_game
    @stdin, @stdout, @wait_thread = Open3.popen2("bin/ttt --test-seed")
  end

  def expect_to_be_asked_to_choose_a_player
    expect(@stdout.gets.chomp).to eq("Which player do you want to be? X or O?")
  end

  def choose_player_x
    @stdin.puts "X"
  end

  def choose_player_o
    @stdin.puts "O"
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

  def expect_to_win
    expect(@stdout.gets.chomp).to eq("You won, congrats!")
  end

  def wait_thread_to_exit
    Timeout::timeout(1) { @wait_thread.join }
  end

  after do
    @stdin.close
    @stdout.close
  end
end
