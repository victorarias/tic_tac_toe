class Mark
  vattr_initialize :value

  def to_s
    value
  end
end

NoMark = Mark.new(" ")
