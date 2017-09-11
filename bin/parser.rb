#!/usr/bin/env ruby

require_relative '../app/file_parser'
require 'active_support'
require 'active_support/core_ext/object'

log_file = ARGV[0]

if !log_file.present?
  puts "\nUsage: /bin/parser.rb /path/to/logfile\n"
  exit
end

parser = FileParser.new(log_file)
parser.read_file

parser.ordered_pages_views.each do |path, visits|
  puts "#{path} #{visits} visits"
end

puts "\n"

parser.ordered_unique_page_views.each do |path, visits|
  puts "#{path} #{visits} unique views"
end
