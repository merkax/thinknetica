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
    trains.each { |train| puts "Поезд номер: #{train.number}" }
  end

  def send_train(train)
    trains.delete(train)
  end

  def select_type(type)
    trains.select { |train| train.type == type } 
  end
end
