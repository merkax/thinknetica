vowels = {}

('a'..'z').each.with_index(1) do |key, value|
  vowels[key] = value if ['a','e','i','o','u'].include?(key)
end
puts vowels
