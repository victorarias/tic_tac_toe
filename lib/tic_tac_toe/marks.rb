class TicTacToe
  class Mark
    vattr_initialize :value

    def to_s
      value
    end
  end

  NoMark = Mark.new(" ")
  XMark = Mark.new("X")
  OMark = Mark.new("O")
end
