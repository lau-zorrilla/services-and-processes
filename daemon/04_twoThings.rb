#!/usr/bin/env ruby

x = 0

Thread.new do
  while x < 5000
    x -= 1
    puts "DEC: I decremented x to #{x}\n"
  end
  puts "DEC is too high. I give up!"
end
while x < 5000
  x += 3
  puts "I incremented x to #{x}\n"
end
