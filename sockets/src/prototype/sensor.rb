require 'socket'

class Sensor
    attr_reader :wired, :positon
    
    def initialize(wired, positon)
        @wired = wired
        @positon = positon
        @socket = TCPSocket.open('localhost', 2000)
        connect
    end

    def connect
        while line = @socket.gets do
            if "EOF" != line.chomp then
                puts line
            else
                break
            end
        end  
    end

    def send(message)
        @socket.send message+"\n", 0
    end
    
    def close
        @socket.send "Disconnect", 0
    end
end

class Thermometer < Sensor
end

class Altimeter < Sensor
end

class Barometer < Sensor
end

class Accelerometer < Sensor
end

class Humidty < Sensor
end

class Distance < Sensor
end

class Weight < Sensor
end

class Visibility < Sensor
end

class Weather < Sensor
end

class Turbulence < Sensor
end

class LandingGear < Sensor
end

class Bathroom < Sensor
end

class Bird < Sensor
end
