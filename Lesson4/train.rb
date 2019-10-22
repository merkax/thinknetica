# Разделить поезда на два типа PassengerTrain и CargoTrain, сделать родителя для классов, который будет содержать общие методы и свойства
# Вагоны теперь делятся на грузовые и пассажирские (отдельные классы). 
# К пассажирскому поезду можно прицепить только пассажирские, к грузовому - грузовые. 
# При добавлении вагона к поезду, объект вагона должен передаваться как аргумент метода и сохраняться во внутреннем массиве поезда, 
# в отличие от предыдущего задания, где мы считали только кол-во вагонов.

# Определить, какие методы могут быть помещены в private/protected и вынести их в такую секцию. 
# В комментарии к методу обосновать, почему он был вынесен в private/protected
require_relative 'cargo_wagon'
class Train
  attr_accessor :speed
  attr_reader   :amount, :type, :number, :wagons

  def initialize(number, type)
    @number = number
    @type = type
    @speed = 0
    @wagons = []
  end

  def stop
    self.speed = 0
  end

  def add_wagon(wagon) # wagon объект класса wagon
    if type == wagon.type && speed.zero?
      wagons << wagon
    else
      puts "Поезд движется либо не тот тип вагона"
    end  
  end

  def remove_wagon#(wagon)
    if speed.zero? && wagons.any? #  type == wagon.type &&
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
