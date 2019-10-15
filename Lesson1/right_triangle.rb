triagle = []
3.times do 
  puts "Введите  сторону треугольника"
  side = gets.to_f
  triagle << side
end

triagle.sort!

a = triagle[0]
b = triagle[1]
c = triagle[2]

if (c**2 == a**2 + b**2) && a == b
  puts "Треугольник равнобедренный и прямоугольный"
elsif c**2 == a**2 + b**2
  puts "Треугольник прямоугольный"
elsif c == b && c == a && b == a
  puts "Треугольник равнобедренный и равносторонний"  
elsif (c == b) || (c == a ) || (b == a)
  puts "Треугольник равнобедренный"
else
  puts "Треугольник не является прямоугольным"
end
