order = {}

loop do
  puts "Введите название товара"
  name = gets.chomp.downcase
  break if name == 'стоп'
  puts "Введите цену за еденицу товара"
  price = gets.chomp.to_f
  puts "Введите количество товара"
  amount = gets.chomp.to_f
  order[name] = {price: price, amount: amount}  
end

puts order
final_price = 0

order.each do |key, value|
  item_price = value[:price] * value[:amount]
  final_price += item_price 
  puts "Товар: #{key}, цена: #{item_price}"
end

puts "Итоговая сумма: #{final_price}"
