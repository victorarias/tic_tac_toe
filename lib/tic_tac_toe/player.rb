class TicTacToe
  class Player
    vattr_initialize :mark, :client

    def select_move
      client.say("Where do you want to move?")
      human_move = client.read_player_command
      Position.parse(human_move)
    end
  end
end
