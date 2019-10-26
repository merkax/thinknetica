# require_relative 'instance_counter'

class Station
  include InstanceCounter

  attr_reader :trains, :name

  @@all_stations = []

  def initialize(name)
    @name = name
    @trains = []
    @@all_stations << self
    register_instance
  end

  def self.all
    @@all_stations
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
