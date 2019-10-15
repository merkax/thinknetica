puts "Введите первый коэффициент"
a = gets.chomp.to_f

puts "Введите второй коэффициент"
b = gets.chomp.to_f

puts "Введите третий коэффициент"
c = gets.chomp.to_f

if a == 0
  puts "Это не квадратное уравнение"
  exit
end

d = b ** 2 - (4 * a * c )

if d > 0
  discriminant = Math.sqrt(d)
  x_one = (-b + discriminant ) / (2 * a)
  x_two = (-b - discriminant ) / (2 * a)
  puts format("Дискриминант равен: %.2f,\nпервый корень :%.2f,"\
      "\nвторой корень :%.2f", d, x_one, x_two)
elsif d == 0  
  x_only = (-b / (2 * a))
  puts "Дискриминант равен: #{d}, Корень :#{x_only}"
else
  puts "Отрицательный дискриминант. Корней нет"
end
