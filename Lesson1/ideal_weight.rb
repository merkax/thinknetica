puts "Как Вас зовут?"
name = gets.strip.capitalize

puts "Какой Ваш рост?"
height = gets.chomp.to_i

if height - 110 <= 0
  puts "#{name}, Ваш вес уже оптимальный"
else 
  puts "#{name}, Ваш идеальный вес состовляет: #{height - 110}"
end