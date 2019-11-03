# frozen_string_literal: true

require_relative 'manufacturer'
require_relative 'validate'

class Wagon
  include Manufacturer
  include Validate

  attr_reader :type, :space, :reserved_space, :number

  def initialize(type, space)
    @type = type
    @space = space
    @number = rand(100)
    @reserved_space = 0
    validate!
  end

  def reserve_space(quantity)
    raise 'Not enough space' if quantity > space || reserved_space + quantity > space

    @reserved_space += quantity
  end

  def free_space
    space - reserved_space
  end

  protected

  def validate!
    raise 'Wrong type' unless type == 'cargo' || type == 'passenger'
    raise 'Capacity cannot be zero or less' if space <= 0
  end
end
