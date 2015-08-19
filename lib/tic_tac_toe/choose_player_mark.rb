class TicTacToe
  class ChoosePlayerMark
    method_object [ :client! ]

    def call
      client.say("Which player do you want to be? X or O?")
      client.read_player_command
    end
  end
end
