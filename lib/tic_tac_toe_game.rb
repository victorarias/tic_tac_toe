class TicTacToeGame
  def self.run
    puts "Which player do you want to be? X or O?"
    player = readline.chomp
    puts "You've chosen #{player}."
  end
end
