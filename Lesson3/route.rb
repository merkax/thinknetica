class Route
  attr_reader :stations

  def initialize(firs_station, last_station)
    @stations = [firs_station, last_station]
  end

  def add_station(station) 
    stations.insert(1, station)
  end 

  def delete_train(station)
    stations.delete(station) if stations[1...-1].include?(station)
  end

  def show_station
    stations.each { |station| puts station.name } 
  end
end
