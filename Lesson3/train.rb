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
    current_station.add_train(self)
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


