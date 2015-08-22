require "tic_tac_toe/choose_player_mark"

module TicTacToe
  class SelectMarks
    method_object :client

    def call
      player_mark = ChoosePlayerMark.call(client)
      computer_mark = select_computer_mark(player_mark)

      [ player_mark, computer_mark ]
    end

    private

    def select_computer_mark(player_mark)
      [ XMark, OMark ].reject { |mark| mark == player_mark }.first
    end
  end
end
