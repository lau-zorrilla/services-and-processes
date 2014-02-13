#!/usr/bin/env ruby
# fishmarket.rb

require 'thread'

class Client

  @@total_clients = 0

   def initialize
      @@total_clients += 1
      @ticket = @@total_clients
      puts "Cliente creado. Me han dado el ticket #{@ticket}."
   end

   def served
      puts "Client numbered #{@ticket} is served."
   end

end


clients = []
mutex = Mutex.new
number_of_clients_semaphore = ConditionVariable.new

clienter = Thread.new do
   while 1 do  
        sleep rand(2)
        clients.push Client.new 
        number_of_clients_semaphore.signal
   end
end

# fishmonger starts
  while 1 do   
    mutex.synchronize do
      sleep rand(5)
      number_of_clients_semaphore.wait(mutex)
      clients.shift.served # shift quita el primer elemento y desplaza a todos los demas.
    end
  end

clienter.join unless ARGV[0]
