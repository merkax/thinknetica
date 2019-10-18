class Station
  attr_reader :trains, :name
  # 1) Я правильно понял, если не укажу их в геттере, то не смогу использовать в другом классе(вне этого класса)?
  # 2) Если укажу их здесь, то в дальнейшем в этом классе эти атрибуты лучше использовать без знака @?
  # 3) Если бы был только attr_writer..., то я бы смог использовать эти атрибуты в дальнейшем внутри класса без знака @? 
  # 4) Если attr_writer, то в случае с изменением значения атрибута лучше использовать self.? тогда в каких случаях стоит использовать @?
  # 5) Если attr_writer, я бы не смог обращаться вне класса, а только менять значение(вне класса), верно? 

  def initialize(name)
    @name = name
    @trains = []
  end

  def add_train(train)
    trains << train # 6) Этого способа достаточно для проверки "по одному за раз" так как больше 1 аргумента не примет, верно?
  end

  def show_train
    trains.each {|train| puts train} # 7) train.name? или так как я и так в этом классе, то атрибут name указывать не обязательно?
  end

  def send_train(train)
    trains.delete(train)
  end

  def select_type(type)
    trains.select{ |train| puts train.type == type } 
    # 8) Правильно сделал? train.type - атрибут класса Train, в котором будет указан тип поезда и при совпадении с аргументом type,
    #который мы передали в этот метод, будет создан новый массив, с поездами данного типа. 
  end
end

class Route
  attr_reader :stations

  def initialize(firs_station, last_station) # 9) Я правильно понял, что в качестве параметров я должен передавать объекты класса Station 
    # и тогда в вопросе 13 все будет работать
    @firs_station = firs_station
    @last_station = last_station
    @stations = [@firs_station, @last_station]
  end

  def add_station(station) 
    stations.insert(1, station) # 10) или лучше insert(-2,station)?
  end 

  def delete_train(station)
    stations.delete(station) if stations[1...-1].include?(station)
  end

  def show_station
    stations.each { |station| puts station.name } 
    # 12) Верно station.name? так как меня интересуют объекты класса Station с этим атрибутом
    # 13) Делал по аналогии с этим http://connect.thinknetica.com/t/oop-vzaimodejstvie-klassov-i-obektov/6632
    #почему тогда не работает?
  end
end

class Train
  attr_reader   :amount, :type
  attr_accessor :speed # набор/сброс скорости оставить в сеттере/геттере или реализовать отдельными методами?

  def initialize(number, type, amount)
    @number = number
    @type = type
    @amount = amount
    @speed = 0
  end

  def stop
    self.speed = 0 # 14) или @?
  end

  def add_wagon
    if speed == 0
      @amount += 1 # 15) Могу ли я написать attr_writer :amount и в данной строке использовать self.amount?
      #Будет ли это правильным решением?
    else
      puts "Поезд движется. Остановите поезд"
    end
  end

  def remove_wagon
    if speed == 0 && @amount > 0
      @amount -= 1
    else
     puts "Поезд движется или у вас нет вагонов"
    end
  end

  def accept_route(route)
    @route = route # 16) Чтобы в дальнешем я мог использовать в этом классе маршрут из класса Route!?
    # 17) Мб лучше вынести current_index и route в attr_reader, чтобы я мог их использовать без @?
    @current_index = 0 # получаю индекс первой станции в маршруте
    @route.show_station.first # получаю первую станцию в маршруте  
  end
  
  # Возвращать предыдущую станцию, текущую, следующую, на основе маршрута
  def current_station
    @route.stations[@current_index]
  end

  def next_station
    @route.stations[@current_index + 1]
  end

  def back_station
    @route.stations[@current_index - 1]
  end

   # Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад, но только на 1 станцию за раз.

end
