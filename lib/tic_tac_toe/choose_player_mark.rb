require "tic_tac_toe/marks"

class TicTacToe
  class ChoosePlayerMark
    method_object :client

    STRING_MARK_TO_MARK = {
      "X" => XMark,
      "O" => OMark
    }

    def call
      client.say("Which player do you want to be? X or O?")

      chosen_mark = parse_player_command

      repeat_until_truthy(chosen_mark) do
        client.say("The mark you selected is invalid. Try again: X or O?")
        parse_player_command
      end
    end

    private

    def parse_player_command
      command = client.read_player_command
      STRING_MARK_TO_MARK[command]
    end

    def repeat_until_truthy(value)
      value = yield until value
      value
    end
  end
end
