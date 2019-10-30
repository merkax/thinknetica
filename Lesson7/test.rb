require_relative 'manufacturer'
require_relative 'instance_counter'
require_relative 'validate'
require_relative 'route'
require_relative 'station'
require_relative 'train'
require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'wagon'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'
# require_relative 'main'


@station1 = Station.new("Первая станция")
@station2 = Station.new("Вторая станция")
@station3 = Station.new("Третья станция")
@station4 = Station.new("Четвертая станция")

@route1 = Route.new(@station1, @station2)
@route2 = Route.new(@station2, @station3)


@cargo1 = CargoTrain.new('aaa33')
@cargo2 = CargoTrain.new('33232')
@cargo3 = CargoTrain.new('33333')

@passenger1 = PassengerTrain.new('66666')
@passenger2 = PassengerTrain.new('55555')
@passenger3 = PassengerTrain.new('77777')

@cargo1.accept_route(@route2)
@passenger1.accept_route(@route1)

wp1 = PassengerWagon.new(300)
p wp2 = PassengerWagon.new(300)

@passenger1.add_wagon(wp1)
@passenger1.add_wagon(wp2)

@passenger1.each_wagons do |wagon| 
  puts "Номер вагона: #{wagon.number}, тип вагона: #{wagon.type}"
  puts "кол-во свободных мест: #{wagon.free_space}, количество занятых мест:#{wagon.reserved_space}"
end

p '=' * 50

@station1.each_train do |train|
  puts "Номер поезда: #{train.number}, тип поезда: #{train.type}"
  puts "Количество вагонов: #{train.wagons.size}"
end
