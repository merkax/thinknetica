# frozen_string_literal: true

require_relative 'train'
require_relative 'validation'

class PassengerTrain < Train
  include Validation

  validate :number, :format, NUMBER_FORMAT

  def initialize(number)
    super(number, 'passenger')
  end
end
