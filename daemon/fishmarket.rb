#!/usr/bin/env ruby
# fishmarket.rb

require 'thread'

clients = Array.new(10)
i = 0
j = 0

for i in 0..10
  clients.push "Cliente #{i} creado"
  puts "Cliente #{i} creado"
  puts "Numero de ticket: #{i}"
end

fishmonger = Thread.new do
  1.upto(10) {
    sleep 2
    puts "Cliente #{i} atendido"
    puts "Proximo cliente: #{i + 1}"
    j += 1
  }
end
fishmonger.join unless ARGV[0]
