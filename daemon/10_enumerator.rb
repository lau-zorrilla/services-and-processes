#!/usr/bin/env ruby
# 10_enumerator.rb
require 'enumerator'

array = [7, 8, 9]

module Enumerable
  def all_simultaneously
    if block_given?
      collect { |e| Thread.new { yield(e) } }.each { |t| t.join }
    else
      enum_for :all_simultaneously
    end
  end

  def collect
    results = []
    each_with_index { |e, i| results[i] = yield(e) }
    results
  end

  def each_with_index
    i = -1
    each { |e| yield e, i += 1 }
  end
end

array.all_simultaneously.collect { |x| sleep 5; x * -1 }
array.all_simultaneously.each_with_index { |x, i| sleep 5; puts "#{i}=>#{x}\n" }
