array = []

i = 10

while i <= 100
  array << i
  i += 5
end

p array

#(5..100).step(5).to_a
