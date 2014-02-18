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

