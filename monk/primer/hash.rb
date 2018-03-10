# ==================== some basics

# iterating over a hash
restaurant_menu = { "Ramen": 3, "Dal Makhani": 4, "Coffee": 2 }
restaurant_menu.each do | item, price |
  puts "#{item}: $#{price}"
end

# extracting data
puts restaurant_menu.keys.inspect
puts restaurant_menu.values.inspect

# constructor default values

a = Hash.new # no defaults
b = Hash.new('def') # default for each key
c = Hash[:a, 'defa', :b, 'defb'] # defaults per key

puts a[:a].inspect
puts b[:a].inspect
puts c[:a].inspect
