class RubyVM
  module MJIT
    def self.pause(wait: true)
      __builtin_mjit_pause_m(wait)
    end
  end
end
