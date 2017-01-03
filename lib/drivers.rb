require "driver.rb"

module RootDriving
  class Drivers
    attr_reader :drivers

    def initialize
      @drivers = []
    end

    def addDriver(driverName)
      driver = Driver.new(driverName)
      @drivers << driver
    end

    def addTrip(driverName, startTime, endTime, distance)
      @drivers.find{ |d| d.name == driverName }.addTrip(startTime, endTime, distance)
    end

    def to_s
      @drivers.reduce("") do |sum, driver|
        sum + driver.to_s + "\n"
      end
    end
  end
end
