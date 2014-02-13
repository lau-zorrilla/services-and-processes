#!/usr/bin/env ruby
# 13_childFileHandle.rb

IO.popen('-', 'r+') do |child_filehandle|
  if child_filehandle
    $stderr.puts "I'm the parent: #{child_filehandle.inspect}"
    child_filehandle.puts '404'
    child_filehandle.close_write
    puts "My child says the square root of 404 is #{child_filehandle.read}"
  else
    $stderr.puts "I'm the child: #{child_filehandle.inspect}"
    number = $stdin.readline.strip.to_i
    $stdout.puts Math.sqrt(number)
  end
end

