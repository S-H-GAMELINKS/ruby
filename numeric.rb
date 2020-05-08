class Numeric
  #
  #  call-seq:
  #     num.round([ndigits])  ->  integer or float
  #
  #  Returns +num+ rounded to the nearest value with
  #  a precision of +ndigits+ decimal digits (default: 0).
  #
  #  Numeric implements this by converting its value to a Float and
  #  invoking Float#round.
  #
  def round(ndigits = 0)
    __builtin_num_round(ndigits)
  end
end

class Integer
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
  def round(x = nil, half: nil)
    __builtin_int_round(x, half)
  end
end

class Float
  #
  #  call-seq:
  #     float.round([ndigits] [, half: mode])  ->  integer or float
  #
  #  Returns +float+ rounded to the nearest value with
  #  a precision of +ndigits+ decimal digits (default: 0).
  #
  #  When the precision is negative, the returned value is an integer
  #  with at least <code>ndigits.abs</code> trailing zeros.
  #
  #  Returns a floating point number when +ndigits+ is positive,
  #  otherwise returns an integer.
  #
  #     1.4.round      #=> 1
  #     1.5.round      #=> 2
  #     1.6.round      #=> 2
  #     (-1.5).round   #=> -2
  #
  #     1.234567.round(2)   #=> 1.23
  #     1.234567.round(3)   #=> 1.235
  #     1.234567.round(4)   #=> 1.2346
  #     1.234567.round(5)   #=> 1.23457
  #
  #     34567.89.round(-5)  #=> 0
  #     34567.89.round(-4)  #=> 30000
  #     34567.89.round(-3)  #=> 35000
  #     34567.89.round(-2)  #=> 34600
  #     34567.89.round(-1)  #=> 34570
  #     34567.89.round(0)   #=> 34568
  #     34567.89.round(1)   #=> 34567.9
  #     34567.89.round(2)   #=> 34567.89
  #     34567.89.round(3)   #=> 34567.89
  #
  #  If the optional +half+ keyword argument is given,
  #  numbers that are half-way between two possible rounded values
  #  will be rounded according to the specified tie-breaking +mode+:
  #
  #  * <code>:up</code> or +nil+: round half away from zero (default)
  #  * <code>:down</code>: round half toward zero
  #  * <code>:even</code>: round half toward the nearest even number
  #
  #     2.5.round(half: :up)      #=> 3
  #     2.5.round(half: :down)    #=> 2
  #     2.5.round(half: :even)    #=> 2
  #     3.5.round(half: :up)      #=> 4
  #     3.5.round(half: :down)    #=> 3
  #     3.5.round(half: :even)    #=> 4
  #     (-2.5).round(half: :up)   #=> -3
  #     (-2.5).round(half: :down) #=> -2
  #     (-2.5).round(half: :even) #=> -2
  #
  def round(ndigits = 0, half: :up)
    __builtin_flo_round(ndigits, half)
  end
end
