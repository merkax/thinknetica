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
# require_relative 'seed'

class Main

  def initialize
    @stations = []
    @trains = []
    @routes = []
  end 

  def run
    loop do
      start_menu

      user_choice = gets.strip.to_i
      break if user_choice.zero?
      
      case user_choice
      when 1
        create_station
      when 2
        create_train
      when 3
        create_route
      when 4
        manage_stations
      when 5
        send_route
      when 6
        add_wagons
      when 7
        remove_wagons
      when 8
        move_the_train_to_next
      when 9
        move_the_train_to_back
      when 10
        show(stations)
      when 11
        show_trains_on_stations
      end
    end
  end

  private

  attr_reader :stations, :routes, :trains

  def start_menu
    puts '=' * 30
    puts 'Введите 0, если вы хотите завершить программу'
    puts 'Введите 1, если вы хотите создать станцию'
    puts 'Введите 2, если вы хотите создать поезд'
    puts 'Введите 3, если вы хотите создать маршрут'
    puts 'Введите 4, если вы хотите управлять станциями'
    puts 'Введите 5, если вы хотите назначить маршрут поезду'
    puts 'Введите 6, если вы хотите добавить вагон поезду'
    puts 'Введите 7, если вы хотите отцепить вагон от поезда'
    puts 'Введите 8, если вы хотите переместить поезд на следующую станцию'
    puts 'Введите 9, если вы хотите переместить поезд на предыдущую станцию'
    puts 'Введите 10, если вы хотите посмотреть список станций.'
    puts 'Введите 11, если вы хотите посмотреть список поездов на станции'
  end

  def show(list)
    list.each.with_index(1){ |item, index| puts "#{index}: #{item}" } 
  end

  def select_from_list(list)
    choise = gets.to_i
    return if choise <= 0
    list[choise - 1]
  end

  def create_station
    puts 'Какую станцию вы хотите создать?'
    user_choice = gets.strip
    new_station = Station.new(user_choice)
    stations << new_station
    show(stations)
  end

  def create_train
    puts 'Какой будет номер у поезда?'
    number = gets.strip
    puts 'Какой будет тип поезда(passenger или cargo)?'
    type = gets.strip
    trains << Train.new(number, type)
    puts "Создан поезд:#{trains.last}"
  rescue RuntimeError => e
    puts "Ошибка: #{e.message}. Попробуйте еще раз."
    retry
  end

  def create_route
    show(stations)
    puts 'Какая будет первая станция?(номер из списка)'
    first_station = select_from_list(stations)
    puts 'Какая будет последняя станция?(номер из списка)'
    last_station = select_from_list(stations)
    return if (first_station == last_station ) && first_station.nil? || last_station.nil? 
    new_route = Route.new(first_station, last_station)
    routes << new_route
    show(routes)
  end

  def manage_stations
    puts 'Выберете маршрут:'
    show(routes)
    route = select_from_list(routes)
    puts 'Введите 1, если вы хотите добавить станцию'
    puts 'Введите 2, если вы хотите удалить станцию'
    user_choice = gets.strip.to_i

    case user_choice
    when 1
      puts 'Выберете какую станцию хотите добавить в маршрут'
      show(stations)
      station = select_from_list(stations)
      route.add_station(station)
    when 2
      puts 'Выберете какую станцию хотите удалить из маршрута'
      show(stations)
      station = select_from_list(stations)
      route.delete_station(station)
    else
      puts 'Такой станции не существует'
    end
  end

  def send_route
    puts 'Выберете поезд'
    show(trains)
    train = select_from_list(trains)
    puts 'Выберете маршрут'
    show(routes)
    route = select_from_list(routes)
    train.accept_route(route)
  end

  def add_wagons
    puts 'Выберете поезд к которому вы хотите добавить вагон'
    show(trains)
    train = select_from_list(trains)

    if train.type == 'passenger'
      wagon = PassengerWagon.new
      train.add_wagon(wagon)
    elsif train.type == 'cargo'
      wagon = CargoWagon.new
      train.add_wagon(wagon)
    end
  end

  def remove_wagons
    puts 'Выберете поезд у которого вы хотите отцепить вагон'
    show(trains)
    train = select_from_list(trains)  
    train.remove_wagon
  end

  def move_the_train_to_next
    puts 'Выберете поезд, который вы хотите переместить на следующую станцию'
    show(trains)
    train = select_from_list(trains)
    puts "Следующая станция: #{train.current_station.name}"
    train.to_the_next_station
  end

  def move_the_train_to_back
    puts 'Выберете поезд у который вы хотите переместить на предыдущую станцию'
    show(trains)
    train = select_from_list(trains)
    #puts "Следующая станция: #{train.current_station.name}" 
    train.back_to_the_station
  end

  def show_trains_on_stations
    puts 'Выберете станцию из списка'
    show(stations)
    station = select_from_list(stations)
    station.show_train
  end
end

Main.new.run
