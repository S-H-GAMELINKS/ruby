require_relative '../../spec_helper'
require 'strscan'

describe "StringScanner#skip_until" do
  before :each do
    @s = StringScanner.new("This is a test")
  end

  it "returns the number of bytes advanced and advances the scan pointer until pattern is matched and consumed" do
    @s.skip_until(/a/).should == 9
    @s.pos.should == 9
    @s.matched.should == "a"
  end

  it "returns nil if no match was found" do
    @s.skip_until(/d+/).should == nil
  end

  ruby_version_is ""..."3.4" do
    it "raises TypeError if given a String" do
      -> {
        @s.skip_until('T')
      }.should raise_error(TypeError, 'wrong argument type String (expected Regexp)')
    end
  end
end
