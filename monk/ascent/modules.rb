# included callback is invoked after including module into a class
module Foo
  def self.included(klass)
    puts "Foo has been included in class #{klass}"
  end
end

class Bar
  include Foo
end

# include is used to share module instance methods with instances of a class
# extend is used to share module instance methods with singleton objects
module Foo2
  def module_level_method
    puts "Module level method"
  end

  def instance_lvl_method
    puts "I'm an instance"
  end
end

class Bar2
  extend Foo2
  include Foo2
end

p Bar2.module_level_method
p Bar2.new.instance_lvl_method

# using extend to 'include' instance method from module
module Foo
  def method_in_module
     "The method defined in the module invoked"
  end
end

class Bar
  def initialize
    self.extend Foo
  end
end

# using extend to add class level methods for class singleton object
module Foo
  def say_hi
    puts "Hi!"
  end
end

class Bar
end

Bar.extend Foo
Bar.say_hi

# task solution
module Foo
  def self.included(klass)
    klass.extend self::ClassMethods
  end
  
  module ClassMethods
    def guitar
      "gently weeps"
    end
  end
end

class Bar
  include Foo
end

puts Bar.guitar

# extended callback called on extending an object (class/instance) with module
module Foo
  def self.extended(base)
    puts "Class #{base} has been extended with module #{self} !"
  end
end

class Bar
  extend Foo
end

# non OO style in ruby by using modules - example Math module
module Weather
  def self.will_it_rain_on(date)
    "it depends"
  end
end

puts Weather.will_it_rain_on(Date.today)