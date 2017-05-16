require_relative 'sensor'

thermometer = Thermometer.new('1', '2')
altimeter = Altimeter.new('1', '2')
thermometer.send("Temperature: 35")
altimeter.send("Height: 2000m")
thermometer.close
altimeter.send("Disconnect")
