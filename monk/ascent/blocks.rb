# block (lamda) example
multiply = -> (a, b) { a*b }
puts multiply.call(3,4)

# ===================== yield

# basic explicit usage example
def calculation(a, b, operation)
  operation.call(a, b)
end

puts calculation(4, 5, multiply)

# implicit example of yielding of block
def yielding(a, b)
  yield(a, b)
end

puts yielding(2, 8) { |a, b| a - b }

# check if block given in implicit block invocation

def foo
  yield if block_given?
end

# benchmarking explicit vs implicit block passing speed

require "benchmark"

def calculation_with_explicit_block_passing(a, b, operation)
 operation.call(a, b)
end

def calculation_with_implicit_block_passing(a, b)
 yield(a, b)
end

Benchmark.bmbm(10) do |report|
 report.report("explicit") do
   addition = lambda { |a, b| a + b }
   1000.times { calculation_with_explicit_block_passing(5, 5, addition) }
 end

 report.report("implicit") do
   1000.times { calculation_with_implicit_block_passing(5, 5) { |a, b| a + b } }
 end
end