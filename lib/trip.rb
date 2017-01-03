module RootDriving
  class Trip
    attr_reader :distance

    def initialize(startTime, endTime, distance)
      @startTime = Time.parse(startTime)
      @endTime = Time.parse(endTime)
      @distance = distance.to_f
    end

    def speed
      distance / duration
    end

    def duration
      (@endTime - @startTime) / 3600.0
    end
  end
end
