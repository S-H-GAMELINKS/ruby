class RubyVM
  module MJIT
    module_function
    def pause(wait: true)
      Primitive.attr! 'inline'
      Primitive.mjit_pause_m(wait)
    end
  end
end
