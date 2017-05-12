require 'socket'

class Sensor
    attr_reader :wired, :positon
    
    def initialize(wired, positon)
        @wired = wired
        @positon = positon
        @client = TCPSocket.new('localhost', 2000)    
    end

    def connect
        while line = @client.gets
            puts line
        end
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
