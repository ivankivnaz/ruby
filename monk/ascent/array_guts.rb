#================== desctructurin
a, b = [1, 2]
puts a, b

zen, john = [[4, 8], [3, 16], [23, 42, 15]]

p zen
p john

# desctructuring works by ruby
[[1, 2, 3, 4], [42, 43]].each { |a, b| puts "#{a} #{b}" }

# destrucuring manually
[[1, 2, 3, 4], [42, 43]].each do |element| 
  a, b = element
  puts "#{a} #{b}"
end

#================== splat operator
car, *cdr = [42, 43, 44]
p cdr

*initial, last = [42, 43, 44]

first, *middle, last = [42, 43, 44, 45, 46, 47]

# method that calculates median
def median(*list)
  return nil if list.empty?
  
  mid = list.length / 2
  slist = list.sort
  
  if slist.length.odd?
    slist[mid]
  else
    (slist[mid - 1] + slist[mid]).to_f / 2.0
  end
end

# using splat with ranges & strings
zen = *(1..42)
str = *"Zen"
p str

# splat for method arguments

def zen(a, b)
	a + b
end

puts zen(*[41, 1])

# splat operator in block arguments
[[1, 2, 3, 4], [42, 43]].each { |a, *b| puts "#{a} #{b}" }

# hash

puts Hash[4, 8]
puts Hash[ [[4, 8], [15, 16]] ]

ary = [[4, 8], [15, 16], [23, 42]]
puts Hash[*ary.flatten]