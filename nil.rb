class NilClass
  def to_i
    0
  end

  def to_f
    0.0
  end

  def to_s
    ""
  end

  def to_a
    Array.new
  end

  def to_h
    {}
  end
end
