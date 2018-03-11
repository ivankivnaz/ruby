# implicit to explicit conversion using & operator
def impl2expl(a, b, &block) # explicit passing
  block.call(a,b) # implicit call
end

puts impl2expl(3, 4) { |a, b| a + b } # implicit passing

# implicit to explicit conversion using & operator
def expl2impl(a, b) # implicit passing
  yield(a, b) # implicing call
end

div = -> (a, b) { a / b }

puts expl2impl(9, 4, &div)

# usage examples
def filter(array, block)
  return array.select(&block) # .sum(&:+)
end

Filter = lambda do |array, &block|
  array.select(&block)
end