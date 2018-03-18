# ===== elements number in an array
puts "# ===== elements number in an array"
puts [4, 8, 15, 16, 23, 42].count
puts [4, 8, 15, 16, 23, 42].size
puts [4, 8, 15, 16, 23, 42].length

# count number of specific objects
puts "# count number of specific objects"
puts [42, 8, 15, 16, 23, 42].count(42)
puts ["Jacob", "Alexandra", "Mikhail", "Karl", "Dogen", "Jacob"].count("Jacob")
p [4, 8, 15, 16, 23, 42].count { |e| e % 2 == 0 }

#===== index of specific element in an array
puts [4, 8, 15, 16, 23, 42].index(15)
puts [4, 8, 15, 16, 23, 42].index { |e| e % 2 == 0 } 

# ===== flatten - recursively unpack subarrays in one array
puts "# ===== flatten - recursively unpack subarrays in one array"
p [4, 8, 15, 16, 23, 42].flatten
p [4, [8], [15], [16, [23, 42]]].flatten

# restrict number of recursion levels
puts "# restrict number of recursion levels"
[4, [8], [15], [16, [23, 42]]].flatten(1)

# ===== compact returns array with no nil values
puts "# ===== compact returns array with no nil values"
p [nil, 4, nil, 8, 15, 16, nil, 23, 42, nil].compact

# ==== zip method makes array possible compinations
puts "# ==== zip method makes array possible compinations"
p [4, 8, 15, 16, 23, 42].zip([42, 23, 16, 15, 8])

# ==== extracting subarrays with slice or []
puts "# ==== extracting subarrays with slice or []"
p [4, 8, 15, 16, 23, 42].slice(2)
p [4, 8, 15, 16, 23, 42].slice(2..5)

# === join into a string
puts "# === join into a string"
[4, 8, 15, 16, 23, 42].join(", ")

def few2last(array)
  array.slice(-2..-1).join("|")
end

# === shift/unshift
puts "# === shift/unshift"

p [8, 15, 16, 23, 42].unshift(4)
p [16, 23, 42].unshift(4, 8, 15)

# === pack
puts "# === pack"
p [177, 8978].pack("UU")
p [177, 8978].pack("U*")