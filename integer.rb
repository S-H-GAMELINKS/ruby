class Integer
  # call-seq:
  #    int.zero? -> true or false
  #
  # Returns +true+ if +num+ has a zero value.
  def zero?
    Primitive.attr! 'inline'
    Primitive.cexpr! 'int_zero_p(self)'
  end

  #
  #  Document-method: Integer#round
  #  call-seq:
  #     int.round([ndigits] [, half: mode])  ->  integer or float
  #
  #  Returns +int+ rounded to the nearest value with
  #  a precision of +ndigits+ decimal digits (default: 0).
  #
  #  When the precision is negative, the returned value is an integer
  #  with at least <code>ndigits.abs</code> trailing zeros.
  #
  #  Returns +self+ when +ndigits+ is zero or positive.
  #
  #     1.round           #=> 1
  #     1.round(2)        #=> 1
  #     15.round(-1)      #=> 20
  #     (-15).round(-1)   #=> -20
  #
  #  The optional +half+ keyword argument is available
  #  similar to Float#round.
  #
  #     25.round(-1, half: :up)      #=> 30
  #     25.round(-1, half: :down)    #=> 20
  #     25.round(-1, half: :even)    #=> 20
  #     35.round(-1, half: :up)      #=> 40
  #     35.round(-1, half: :down)    #=> 30
  #     35.round(-1, half: :even)    #=> 40
  #     (-25).round(-1, half: :up)   #=> -30
  #     (-25).round(-1, half: :down) #=> -20
  #     (-25).round(-1, half: :even) #=> -20
  #
  def round(ndigits = 0, half: :up)
    return self if ndigits == 0 && half == :up
    __builtin_int_round(ndigits, half)
  end
end
