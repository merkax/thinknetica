require_relative 'wagon'

class CargoWagon < Wagon

#   Для грузовых вагонов:
# Добавить атрибут общего объема (задается при создании вагона)
# Добавить метод, которые "занимает объем" в вагоне (объем указывается в качестве параметра метода)
# Добавить метод, который возвращает занятый объем
# Добавить метод, который возвращает оставшийся (доступный) объем

  def initialize
    type = 'cargo'

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
