require "tic_tac_toe/position"

class TicTacToe
  class Player
    vattr_initialize :client

    def select_move
      client.say("Where do you want to move?")
      human_move = client.read_player_command
      Position.parse(human_move)
    end
  end
end
