require_relative 'sensor'

class Fligth
    attr_reader :sensors

    def initialize(sensors)
        @sensors
    end
end

class VirtualSensor
    def initialize(s1, s2, s3)
        @s1 = s1
        @s2 = s2
        @s3 = s3
    end
end

class Operator
    attr_reader :server

    def initialize(flight)
        @server = TCPServer.open('localhost', 2000)
        @flight = flight
        connect
    end

    def createVirtual

    end

    def connect
        loop do
            Thread.start(@server.accept) do |client|
                puts "Accepting connection from: #{client.peeraddr[2]}"
                client.puts "Hello!\nYou're now connected to the server - " + Time.now.ctime
                client.puts "EOF"
                
                begin
                    while client do
                        incomingData = client.gets
                        incomingData = incomingData.chomp if nil != incomingData
                        
                        puts "Incoming: #{incomingData}"

                        if "Disconnect" == incomingData then
                            puts "Recieved: Disconnect, closed connection"
                            client.close
                            break
                        else
                            client.puts "[SERVER] We recieved: #{incomingData}"
                            client.flush 
                        end
                    end
                rescue Exception => e
                    puts "#{e}(#{e.class})"                    
                ensure
                    client.close
                    puts "Ensure: closing"
                end
            end
        end
    end
end

ope = Operator.new('hey')
