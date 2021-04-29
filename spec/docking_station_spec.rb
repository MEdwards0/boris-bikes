require 'docking_station.rb'

describe DockingStation do
  it 'docking station responds to release bike' do
    expect(subject).to respond_to :release_bike
  end

  it 'allows a bike to be docked' do
    expect(subject).to respond_to(:dock).with(1).argument
  end

  it 'allows you to view bikes' do
    expect(subject).to respond_to(:bikes)
  end

  it 'docks a bike' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq([bike])
  end

  it 'returns if a bike is docked' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bikes).to eq([bike])
  end

  describe '#release_bike' do
    it 'Checks if bikes are available' do
      expect { subject.release_bike }.to raise_error "No bikes available"
    end
  end

  describe '#dock' do
    it 'Check if a dock is full' do
      subject.capacity.times { subject.dock(Bike.new) }
      expect { subject.dock(Bike.new)}.to raise_error "Docking station is full"
    end
  end

  it 'Has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  describe 'initialization' do
    it 'Initialization has variable capacity' do
      docking_station = DockingStation.new(30)
      docking_station.capacity.times { docking_station.dock(Bike.new) }
      expect { docking_station.dock(Bike.new) }.to raise_error("Docking station is full")
    end
  end

  describe 'initialization' do
    bike = Bike.new
    it 'Uses default value' do
      described_class::DEFAULT_CAPACITY.times { subject.dock(bike) }
      expect {subject.dock(bike)}.to raise_error("Docking station is full")
    end
  end

  it 'Throw error if releasing broken bike' do
    bike = Bike.new
    bike.report_broken
    subject.dock(bike)
    expect { subject.release_bike }.to raise_error("Bike is broken")
  end
end

