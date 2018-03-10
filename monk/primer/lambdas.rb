# lambda - a function without a name
add = lambda { |a, b| a + b }
puts add.call(2, 4)

subtract = -> (a, b) { a - b }
puts subtract.call(2, 4)