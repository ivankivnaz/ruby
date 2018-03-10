# basic class example
class Rectangle
  def initialize(length, breadth)
    @length = length
    @breadth = breadth
  end

  def perimeter
    2 * (@length + @breadth)
  end

  def area
    @length * @breadth
  end
end

# determining class
a = Rectangle.new(4, 5)
a.class
a.is_a?(Rectangle)

# ==================== methods
# are also objects
method_obj = 1.method('next')
puts method_obj.call

# ==================== method params

# default
def meth(a = 1, b = 2)
end

# indefinite count of params

def add(*numbers) # 'splatting' list to array
  numbers.inject(0) { |sum, number| sum + number }
end
puts add(1)
puts add(1, 2)
puts add(1, 2, 3)

def add(a_number, another_number, yet_another_number)
  a_number + another_number + yet_another_number
end

# 'splatting' array to list
numbers_to_add = [1, 2, 3] # Without a splat, this is just one parameter
puts add(*numbers_to_add)

# naming params
def add(a_number, another_number, options = {})
  sum = a_number + another_number
  sum = sum.abs if options[:absolute]
  sum = sum.round(options[:precision]) if options[:round]
  sum
end

puts add(1.0134, -5.568)
puts add(1.0134, -5.568, absolute: true)
puts add(1.0134, -5.568, absolute: true, round: true, precision: 2)