# ==================== '' vs ""
# "" allow for escape sequences
puts "\n new line string, \n 2nd line"

# "" allow interpolation
str = 'piece'
puts "interpolated #{str} of string"

# ==================== splitting strings
a = "one,two,three,four"
puts a
puts a.split(',')

# ==================== + vs .concat vs <<
a = 'a'
b = 'b'

puts (a + b) # immutable
puts a
puts a.concat(b) # mutable
puts a
a << b # mutable
puts a

# ==================== substitution

# only first occurence
puts "I should look into your problem when I get time".sub('I','We')

# all occurences globally
puts "I should look into your problem when I get time".gsub('I','We')

# ====================  looking for mathces with regex
'RubyMonk Is Pretty Brilliant'.match(/ ./)