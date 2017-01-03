require "spec_helper"
require "drivers.rb"
require "driver.rb"

describe RootDriving::Drivers do
  let(:drivers) { described_class.new }
  let(:addDriverAndTrips) {
    drivers.addDriver("Test")
    drivers.addDriver("Test2")
    drivers.addTrip("Test", "00:10", "01:10", 50)
    drivers.addTrip("Test", "10:10", "11:10", 60)

    drivers.addTrip("Test2", "00:10", "00:12", 500)
    drivers.addTrip("Test2", "12:15", "13:15", 80)
  }

  describe 'initialize' do
    it 'initializes with no drivers' do
      expect(drivers.drivers).to be_empty
    end
  end

  describe 'addDriver' do
    it 'adds a driver properly' do
      drivers.addDriver("Test")

      expect(drivers.drivers[0].name).to eq("Test")
    end
  end

  describe 'addTrip' do
    it 'adds trip properly' do
      drivers.addDriver("Test")
      drivers.addTrip("Test", "00:10", "01:10", 50)

      expect(drivers.drivers[0].totalTrips).to eq(1)
    end
  end

  describe 'to_s' do
    it 'outputs correct string' do
      addDriverAndTrips

      expect(drivers.to_s).to eq("Test: 110 miles @ 55 mph\nTest2: 80 miles @ 80 mph\n")
    end
  end
end
