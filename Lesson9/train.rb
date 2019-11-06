# frozen_string_literal: true

require_relative 'validation'
require_relative 'accessors'
require_relative 'wagon'
require_relative 'cargo_wagon'
require_relative 'passenger_wagon'
require_relative 'manufacturer'
require_relative 'instance_counter'

class Train
  include Manufacturer
  include InstanceCounter
  include Validation
  include Acсessors

  NUMBER_FORMAT = /^([a-zа-я0-9]{3})([-— − –])?([a-zа-я0-9]{2})$/i.freeze
  @@trains = {}

  attr_accessor :speed
  attr_reader   :type, :number, :wagons
  attr_accessor_with_history :number

  # validate :number, :presence
  validate :number, :format, NUMBER_FORMAT

  def initialize(number, type)
    @number = number
    @type = type
    @speed = 0
    validate!
    @wagons = []
    @@trains[number] = self
    register_instance
  end

  def each_wagons
    wagons.each { |wagon| yield(wagon) }
  end

  def self.find(number)
    @@trains[number]
  end

  def stop
    self.speed = 0
  end

  def add_wagon(wagon)
    wagons << wagon if type == wagon.type && speed.zero?
  end

  def remove_wagon
    wagons.pop if speed.zero? && wagons.any?
  end

  def accept_route(route)
    @route = route
    @current_index = 0
    current_station.add_train(self)
  end

  def to_the_next_station
    return unless next_station

    current_station.send_train(self)
    next_station.add_train(self)
    @current_index += 1
  end

  def back_to_the_station
    return unless back_station

    current_station.send_train(self)
    back_station.add_train(self)
    @current_index -= 1
  end

  def current_station
    @route.stations[@current_index]
  end

  def next_station
    @route.stations[@current_index + 1] unless @current_station == @route.stations.last
  end

  def back_station
    @route.stations[@current_index - 1] unless @current_index.zero?
  end

  protected

  def validate!
    super
    raise 'Wrong type train' unless type == 'cargo' || type == 'passenger'
  end
end
