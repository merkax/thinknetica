class Station
  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def add_train(train)
    trains << train 
  end

  def show_train
    trains.each { |train| puts train.number }
  end

  def send_train(train)
    trains.delete(train)
  end

  def select_type(type)
    trains.select{ |train| puts train.type == type } 
  end
end

class Route
  attr_reader :stations

  def initialize(firs_station, last_station)
    @firs_station = firs_station
    @last_station = last_station
    @stations = [@firs_station, @last_station]
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

class Train
  attr_reader   :amount, :type, :number #, :route
  attr_accessor :speed 
  def initialize(number, type, amount)
    @number = number
    @type = type
    @amount = amount
    @speed = 0
  end

  def stop
    self.speed = 0
  end

  def add_wagon
    if speed.zero?
      @amount += 1 
    else
      puts "Поезд движется. Остановите поезд"
    end
  end

  def remove_wagon
    if speed.zero? && @amount > 0
      @amount -= 1
    else
     puts "Поезд движется или у вас нет вагонов"
    end
  end

  def accept_route(route)
    @route = route
    @current_index = 0
    @route.stations.first.add_train(self)
    # 1)мб добавить в классе Route метод first_station(кот. будет возвращать 1 станцию), чтобы сократить здесь stations.first?
  end
  
  def current_station
    @route.stations[@current_index]
  end

  def next_station
    @route.stations[@current_index + 1] unless @current_index == @route.stations.last 
  end

  def back_station
    @route.stations[@current_index - 1] unless @current_index == 0
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
end

