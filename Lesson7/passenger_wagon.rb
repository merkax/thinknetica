require_relative 'wagon'

class PassengerWagon < Wagon
  
  # attr_reader :quantity_of_seats

  def initialize(quantity_of_seats)
    type = 'passenger'
    # @quantity_of_seats = Array.new(quantity_of_seats){nil}
  end

  # def take_the_place(seats)
  #   quantity_of_seats[seats - 1] = "taken"
  # end

  # def places_taken
  #   quantity_of_seats.count { |place| place == 'taken' }
  # end

  # def free_places
  #   quantity_of_seats.count { |place| place == nil }
  # end
end
