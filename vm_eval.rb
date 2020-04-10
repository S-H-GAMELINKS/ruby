module Kernel
  #
  #  call-seq:
  #     loop { block }
  #     loop            -> an_enumerator
  #
  #  Repeatedly executes the block.
  #
  #  If no block is given, an enumerator is returned instead.
  #
  #     loop do
  #       print "Input: "
  #       line = gets
  #       break if !line or line =~ /^qQ/
  #       # ...
  #     end
  #
  #  StopIteration raised in the block breaks the loop.  In this case,
  #  loop returns the "result" value stored in the exception.
  #
  #     enum = Enumerator.new { |y|
  #       y << "one"
  #       y << "two"
  #       :ok
  #     }
  #
  #     result = loop {
  #       puts enum.next
  #     } #=> :ok
  #
  def loop(&block)
    __builtin_rb_f_loop
  rescue StopIteration
    __builtin_loop_stop(yield)
  end
end
