require "attr_extras"

require "tic_tac_toe/marks"

NoMark = TicTacToe::NoMark
XMark = TicTacToe::XMark
OMark = TicTacToe::OMark

RSpec.configure do |config|
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.order = :random
  Kernel.srand config.seed
end
