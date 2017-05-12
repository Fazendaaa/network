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
        @server = TCPServer.new('localhost', 2000)
        @flight = flight
        createVirtual()
        connect()
    end

    def createVirtual

    end

    def connect
        loop do
            client = @server.accept
            client.puts 'Hello!'
            client.close
        end
    end
end

ope = Operator.new('hey')
