# require_relative 'instance_counter'

class Route
  include InstanceCounter

  attr_reader :stations

  def initialize(firs_station, last_station)
    @stations = [firs_station, last_station]
    register_instance
  end

  def add_station(station) 
    stations.insert(1, station)
  end 

  def delete_station(station)
    stations.delete(station) if stations[1...-1].include?(station)
  end

  def show_station
    stations.each { |station| puts station.name } 
  end
end
