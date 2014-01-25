#!/usr/bin/env ruby
# 02_daemon.rb

require 'tempfile'
 
puts 'About to daemonize'

fork do
  Process.daemon
  log = Tempfile.new('daemon.log')
  loop do
    log.puts "I'm a daemon doin' daemon things"
    log.flush
    sleep 5
  end
end

puts 'The subprocess has become a daemon'
puts "But I'm going to stick around for a while"
sleep 10
puts "Okay, I'm done"
