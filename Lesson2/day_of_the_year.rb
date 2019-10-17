def leap_year(year)
  if year % 400 == 0
    29
  elsif year % 4 == 0 && year % 100 != 0
    29
  else
    28
  end
end

puts "Day?"
day = gets.chomp.to_i

puts "Month?"
month = gets.chomp.to_i

puts "Year?"
year = gets.chomp.to_i

months = [31, leap_year(year), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

p day + months.take(month - 1).sum
