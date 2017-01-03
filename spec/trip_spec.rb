require "spec_helper"
require "trip.rb"

describe RootDriving::Trip do
  let(:trip) { described_class.new("00:10", "01:10", "12.21") }

  describe 'initialize' do
    it 'initializes and converts' do
      expect(trip.distance).to eq(12.21)
    end
  end

  describe 'speed' do
    it 'calulates correct speed' do
      expect(trip.speed).to eq(12.21)
    end
  end

  describe 'duration' do
    it 'calculates correct duration' do
      expect(trip.duration).to eq(1)
    end
  end
end
