class Kernel
    module_function

  #
  # call-seq:
  #    Rational(x, y, exception: true)  ->  rational or nil
  #    Rational(arg, exception: true)   ->  rational or nil
  #
  # Returns +x/y+ or +arg+ as a Rational.
  #
  #    Rational(2, 3)   #=> (2/3)
  #    Rational(5)      #=> (5/1)
  #    Rational(0.5)    #=> (1/2)
  #    Rational(0.3)    #=> (5404319552844595/18014398509481984)
  #
  #    Rational("2/3")  #=> (2/3)
  #    Rational("0.3")  #=> (3/10)
  #
  #    Rational("10 cents")  #=> ArgumentError
  #    Rational(nil)         #=> TypeError
  #    Rational(1, nil)      #=> TypeError
  #
  #    Rational("10 cents", exception: false)  #=> nil
  #
  # Syntax of the string form:
  #
  #   string form = extra spaces , rational , extra spaces ;
  #   rational = [ sign ] , unsigned rational ;
  #   unsigned rational = numerator | numerator , "/" , denominator ;
  #   numerator = integer part | fractional part | integer part , fractional part ;
  #   denominator = digits ;
  #   integer part = digits ;
  #   fractional part = "." , digits , [ ( "e" | "E" ) , [ sign ] , digits ] ;
  #   sign = "-" | "+" ;
  #   digits = digit , { digit | "_" , digit } ;
  #   digit = "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" ;
  #   extra spaces = ? \s* ? ;
  #
  # See also String#to_r.
  #
  def Rational(x, y = nil, exception: true)
    __builtin_nurat_f_rational(x, y, exception)  
  end
end
