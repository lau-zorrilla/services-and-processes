#!/usr/bin/env ruby
# 12_popen.rb

IO.popen('tail -3', 'r+') do |pipe|
  1.upto(100) {|i| pipe << "This is the line #{i}.\n" }
  pipe.close_write
  puts pipe.read
end
