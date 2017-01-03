require "spec_helper"
require "driver.rb"

describe RootDriving::Driver do
  let(:driver) { described_class.new("Test") }
  let(:addValidTrip) { driver.addTrip("00:10", "01:10", 40) }
  let(:addValidTrip2) { driver.addTrip("10:25", "11:25", 30) }
  let(:addLowSpeedTrip) { driver.addTrip("00:10", "01:10", 3) }
  let(:addHighSpeedTrip) { driver.addTrip("00:10", "01:10", 110) }

  describe 'initialize' do
    it 'initializes with a name' do
      expect(driver.name).to eq("Test")
    end
  end

  describe 'addTrip' do
    it 'adds a valid trip' do
      addValidTrip

      expect(driver.totalTrips).to eq(1)
    end

    it 'does not add invalid trips' do
      addLowSpeedTrip
      addHighSpeedTrip

      expect(driver.totalTrips).to eq(0)
    end
  end

  describe 'totalTrips' do
    it 'returns correct number of trips' do
      addValidTrip
      addValidTrip2

      expect(driver.totalTrips).to eq(2)
    end

    it 'does not add invalid trips' do
      addLowSpeedTrip
      addHighSpeedTrip

      expect(driver.totalTrips).to eq(0)
    end
  end

  describe 'totalDistance' do
    it 'returns correct distance' do
      addValidTrip
      addValidTrip2

      expect(driver.totalDistance).to eq(70)
    end
  end

  describe 'totalDuration' do
    it 'returns correct duration' do
      addValidTrip
      addValidTrip2

      expect(driver.totalDuration).to eq(2)
    end
  end

  describe 'averageSpeed' do
    it 'returns correct speed' do
      addValidTrip
      addValidTrip2

      expect(driver.averageSpeed).to eq(35)
    end
  end

  describe  'to_s' do
    it 'returns correct string for 0 distance' do
      expect(driver.to_s).to eq("Test: 0 miles")
    end

    it 'returns correct string for non-zero distance' do
      addValidTrip
      addValidTrip2

      expect(driver.to_s).to eq("Test: 70 miles @ 35 mph")
    end
  end
 end
