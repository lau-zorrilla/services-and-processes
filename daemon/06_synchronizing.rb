#!/usr/bin/env ruby

require 'thread'

class Object
  def synchronize
    mutex.synchronize {yield self}
  end
  def mutex
    @mutex ||= Mutex.new
  end
end

list = []
Thread.new {list.synchronize { |l| sleep(5); 3.times {1.push "Thread 1"}}}
Thread.new {list.synchronize { |l| 3.times {1.push "Thread 2"}}}
sleep(6)
puts "I'm done"
list
