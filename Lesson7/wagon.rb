require_relative 'manufacturer'
require_relative 'validate'

class Wagon
  include Manufacturer
  include Validate

  attr_reader :type

  def initialize(type)
    @type = type
    validate!
  end 

  protected

  def validate!
    raise 'Wrong type' unless type == 'cargo' || type == 'passenger'
  end
end
