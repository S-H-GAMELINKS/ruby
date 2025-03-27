#! /usr/bin/ruby
# -*- coding: us-ascii -*-

# Used to build the Ruby parsing code in common.mk and Ripper.

require 'fileutils'

PARSER_SRCS = %w(
  parse.y
  parser_bits.h
  parser_node.h
  parser_st.c
  parser_st.h
  parser_value.h
  ruby_parser.c
  rubyparser.h
)


PARSER_SRCS.each do |arg|
  from = File.join(File.dirname(File.dirname(__FILE__)), "ext/parser/#{arg}")
  src_path = File.join(File.dirname(File.dirname(__FILE__)), arg)
  build_dir_path = File.join(Dir.pwd, arg)

  FileUtils.cp from, src_path
  FileUtils.cp from, build_dir_path
end
