# 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89
fib = [0,1]

loop do
  number = fib[-1] + fib[-2]
  break if number > 100
  fib << number
  #p fib
end

p fib
