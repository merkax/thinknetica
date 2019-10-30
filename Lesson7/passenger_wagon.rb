require_relative 'wagon'

class PassengerWagon < Wagon

  def initialize(space)
    super('passenger', space)
  end

  def reserve_space(quantity)
    super(1)
  end
end
