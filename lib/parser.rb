module RootDriving
  class Parser
    def Parser.parse(rawInput)
      puts rawInput
      lines = lines(rawInput)
      drivers = Drivers.new

      lines.each { |l| parseLine(l, drivers) }

      drivers
    end

    private

    def Parser.lines(input)
      input.split("\n")
    end

    def Parser.parseLine(line, drivers)
      line = line.split(" ")

      if line[0] == "Driver"
        drivers.addDriver(line[1])
      elsif line[0] == "Trip"
        drivers.addTrip(line[1], line[2], line[3], line[4])
      end
    end
  end
end
