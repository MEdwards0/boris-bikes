require_relative './bike.rb'

class DockingStation
  DEFAULT_CAPACITY = 20
  
  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end
  
  attr_accessor :capacity
  attr_reader :bikes

  def release_bike
    fail 'No bikes available' if empty?()
    fail 'Bike is broken' unless @bikes[-1].working?
    @bikes.pop
  end

  def dock(bike)
    fail 'Docking station is full' if full?()
    @bikes << bike
  end

  private

  def full?
    @bikes.count >= @capacity
  end

  def empty?
    @bikes.empty?
  end

end
