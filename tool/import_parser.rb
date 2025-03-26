#! /usr/bin/ruby
# -*- coding: us-ascii -*-

# Used to build the Ruby parsing code in common.mk and Ripper.

require 'fileutils'

ARGV.each do |arg|
  from = File.join(File.dirname(File.dirname(__FILE__)), "ext/parser/#{arg}")
  to = File.join(File.dirname(File.dirname(__FILE__)), arg)

  FileUtils.cp from, to

  puts "from: #{from}, to: #{to}"
end
