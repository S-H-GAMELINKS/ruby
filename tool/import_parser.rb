#! /usr/bin/ruby
# -*- coding: us-ascii -*-

# Used to build the Ruby parsing code in common.mk and Ripper.

require 'fileutils'

puts Dir.pwd

ARGV.each do |arg|
  from = File.join(File.dirname(File.dirname(__FILE__)), "ext/parser/#{arg}")
  src_path = File.join(File.dirname(File.dirname(__FILE__)), arg)
  build_dir_path = File.join(Dir.pwd, arg)

  FileUtils.cp from, src_path
  FileUtils.cp from, build_dir_path
end
