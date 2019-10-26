# require_relative 'wagon'
# require_relative 'cargo_wagon'
# require_relative 'passenger_wagon'
# require_relative 'manufacturer'
# require_relative 'instance_counter'

class Train
  include Manufacturer
  include InstanceCounter
  
  attr_accessor :speed
  attr_reader   :type, :number, :wagons

  @@trains = {}
  
  def initialize(number, type)
    @number = number
    @type = type
    @speed = 0
    @wagons = []
    @@trains[number] = self
    register_instance
  end

  def self.find(number)
    @@trains[number] 
  end

  def stop
    self.speed = 0
  end

  def add_wagon(wagon)
    if type == wagon.type && speed.zero?
      wagons << wagon
    else
      puts "Поезд движется либо не тот тип вагона"
    end  
  end

  def remove_wagon
    if speed.zero? && wagons.any?
      wagons.pop
    else
     puts "Поезд движется или у вас нет вагонов"
    end
  end

  def accept_route(route)
    @route = route
    @current_index = 0
    current_station.add_train(self)
  end
  
  def to_the_next_station
    if next_station
      current_station.send_train(self)
      next_station.add_train(self)
      @current_index += 1
    end
  end

  def back_to_the_station
     if back_station
      current_station.send_train(self)
      back_station.add_train(self)
      @current_index -= 1
    end  
  end

  def current_station
    @route.stations[@current_index]
  end

  def next_station
    @route.stations[@current_index + 1] unless @current_station == @route.stations.last 
  end

  def back_station
    @route.stations[@current_index - 1] unless @current_index == 0
  end
end
