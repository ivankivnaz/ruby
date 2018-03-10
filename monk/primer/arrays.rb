# ==================== some basics

# adding new element
ar = [1, 2, 3]

ar.push(4)
puts ar.inspect
ar << 5
puts ar.inspect

# transforming (mapping) of an array
puts ar.map { |i| i*2 }.inspect

# filtering through array
puts ar.select { |i| i % 2 == 0 }.inspect

# ==================== iteration

# for loop
for i in ar
  print i, 'for'
end
puts "\n"
# each loop
ar.each do |i|
  print i, 'each'
end