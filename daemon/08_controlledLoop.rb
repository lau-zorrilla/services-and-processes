#!/usr/bin/env ruby
# 08_controlledLoop.rb

require 'thread'

class LoopingThread < Thread
  def initalize
    @stopped = false
    @paused = false

    super do
      before_loop
      until @stopped
        yield
	Thread.stop if @paused
      end
      after_loop
    end
  end

  def before_loop; end
  def after_loop; end

  def stop
    @stopped = true
  end

  def paused=(paused)
    @paused = paused
    run if !paused
  end
end

class PausableCounter < LoopingThread
  attr_reader :count

  def before_loop
    @count = 0
  end

  def initialize
    super { @count += 1 }
  end

  def after_loop
    puts "I counted up to #{@count} before I was cruelly stopped"
  end
end

counter = PasableCounter.new
sleep 2
counter.paused = true
counter.count
sleep 2
counter.count
counter.paused = false
sleep 2
counter.stop
counter.count










