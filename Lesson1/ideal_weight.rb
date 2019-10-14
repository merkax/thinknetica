puts "Как Вас зовут?"
name = gets.strip.capitalize

puts "Какой Ваш рост?"
height = gets.chomp.to_i

ideal_weight = height - 110

if ideal_weight <= 0
  puts "#{name}, Ваш вес уже оптимальный"
else 
  puts "#{name}, Ваш идеальный вес составляет: #{ideal_weight}"
end
