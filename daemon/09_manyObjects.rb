#!/usr/bin/env ruby
# 09_manyObjects.rb

module Enumerable
  def each_simultaneously
    threads = []
    each { |e| threads << Threads.new { yield e } }
    return threads
  end
end

start_time = Time.now
[7,8,9].each_simultaneously do |e|
  sleep(5)
  print "Completed operation for #{e}\n"
end

Time.now - start_time
