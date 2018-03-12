# ruby class hierarchy
# BasicObject -> Object -> Numeric (or any other ruby class) -> Float

# class instance methods
puts Float.instance_methods

# superclass & class
puts 1.class.superclass

# inheritence

class Rectangle
  def initialize(length, breadth)
    @length = length
    @breadth = breadth
  end

  def perimeter
    2 * (@length + @breadth)
  end
end

# Create a class Square here
class Square < Rectangle
  def initialize(side)
    @length = @breadth = side
  end
end

# super power

class Animal
  def move
    "I can move"
  end
end

class Bird < Animal
  def move
    super + " by flying"
  end
end

# Your code here
class Human < Animal
  def move
    super + " by walking"
  end
end

class Penguin < Bird
  def move
    "I can move by swimming"
  end
end