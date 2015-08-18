class Board
  vattr_initialize :lines

  def self.empty
    Board.new(
      [
        [ NoMark, NoMark, NoMark ],
        [ NoMark, NoMark, NoMark ],
        [ NoMark, NoMark, NoMark ],
      ]
    )
  end
end
