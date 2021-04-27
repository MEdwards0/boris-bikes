require 'docking_station.rb'

describe DockingStation do
  it "docking station responds to release bike" do
  expect(subject).to respond_to :release_bike
  end

  it "gets bike and checks bike is working" do
  bike = subject.release_bike
  expect(bike).to be_working
  end

  it "allows a bike to be docked" do
  expect(subject).to respond_to(:dock).with(1).argument
  end

  it "allows you to view bikes" do
  expect(subject).to respond_to :bike
  end

  it "docks a bike" do
  bike = Bike.new
  expect(subject.dock(bike)).to eq(bike)
  end

  it "returns if a bike is docked" do
    bike = Bike.new
  subject.dock(bike)
  expect(subject.bike).to eq(bike)
  end

end
