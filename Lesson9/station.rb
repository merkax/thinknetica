# frozen_string_literal: true

require_relative 'instance_counter'
require_relative 'validation'
require_relative 'accessors'

class Station
  include InstanceCounter
  include Validation
  include Acсessors

  attr_reader :trains, :name
  attr_accessor_with_history :name
  strong_attr_accessor :name, String

  validate :name, :presence
  validate :name, :type, String

  @@all_stations = []

  def initialize(name)
    @name = name
    @trains = []
    @@all_stations << self
    validate!
    register_instance
  end

  def each_train
    trains.each { |train| yield(train) }
  end

  def self.all
    @@all_stations
  end

  def add_train(train)
    trains << train
  end

  def show_train
    trains.each(&:number)
  end

  def send_train(train)
    trains.delete(train)
  end

  def select_type(type)
    trains.select { |train| train.type == type }
  end

  # protected

  # def validate!
  #   raise 'Name not object string' unless name.is_a? String
  #   raise 'Name can`t be nil' if name.empty?
  # end
end
