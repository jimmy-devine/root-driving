module RootDriving
  class Driver
    attr_reader :name

    def initialize(name)
      @name = name
      @trips = []
    end

    def addTrip(startTime, endTime, distance)
      trip = Trip.new(startTime, endTime, distance)
      @trips << trip if trip.speed > 5 && trip.speed < 100
    end

    def totalTrips
      @trips.count
    end

    def totalDistance
      @trips.map(&:distance).reduce(:+)
    end

    def totalDuration
      @trips.map(&:duration).reduce(:+)
    end

    def averageSpeed
      totalDistance / totalDuration
    end

    def to_s
      speedString = "#{@name}: #{totalDistance ? totalDistance.to_i : 0} miles"
      return speedString if !totalDistance
      speedString + " @ #{averageSpeed.to_i} mph"
    end
  end
end
