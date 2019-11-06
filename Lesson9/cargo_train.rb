# frozen_string_literal: true

require_relative 'train'
require_relative 'validation'

class CargoTrain < Train
  include Validation

  validate :number, :format, NUMBER_FORMAT

  def initialize(number)
    super(number, 'cargo')
  end
end
