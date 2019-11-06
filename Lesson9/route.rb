# frozen_string_literal: true

require_relative 'instance_counter'
require_relative 'validate'

class Route
  include InstanceCounter
  include Validate

  attr_reader :stations

  def initialize(firs_station, last_station)
    @stations = [firs_station, last_station]
    validate!
    register_instance
  end

  def add_station(station)
    stations.insert(1, station)
  end

  def delete_station(station)
    stations.delete(station) if stations[1...-1].include?(station)
  end

  def show_station
    stations.each(&:name)
  end

  protected

  def validate!
    raise 'First station should be an object of Station' unless stations[0].is_a? Station
    raise 'Last station should be an object of Station' unless stations[-1].is_a? Station
    raise 'First and Last station should be different' if stations[0] == stations[-1]
  end
end
