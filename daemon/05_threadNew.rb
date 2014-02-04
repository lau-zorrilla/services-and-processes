#!/usr/bin/env ruby
# 05_TreadNew.rb

counter = 0

counter_thread = Thread.new do
  1.upto(1000000) {counter += 1}
end

counter_thread.join unless ARGV[0]
puts "the counter was able to count up to #{counter}"
