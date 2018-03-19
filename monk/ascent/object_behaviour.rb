# === send method
puts "# === send method"
class Foo
end

foo=Foo.new
p foo.send(:object_id)  # this is same as foo.object_id
p foo.send(:class)      # this is same as foo.class

# === checking whether object has behaviour inherited or instanciated from a given class
puts "# === checking whether object has behaviour inherited or instanciated from a given class"
class Foo
end

p Foo.is_a?(Object)
p Foo.new.is_a?(Object)

# === defining parent class with superclass method
puts "# === defining parent class with superclass method"
class Bar
  def shout
    "I'm a Bar!!"
  end
end

class Foo2 < Bar
end

p Foo2.new.shout
p Foo2.superclass

# === inheritance tree
puts "# === inheritance tree"
class Foo3
end

p Foo3.superclass
p Foo3.superclass.superclass
p Foo3.superclass.superclass.superclass

# === superclasses method
puts "# === superclasses method"
class Object
  def superclasses(klass = self.superclass)
    return [] if klass.nil?
    [klass] + superclasses(klass.superclass)
  end
end

class Bar4
end

class Foo4 < Bar4
end

p Foo4.superclasses  # should be [Bar, Object, BasicObject]

# === ancestors
puts "# === ancestors"
class Bar5
end
  
class Foo5 < Bar5
end

p Foo5.ancestors

# === basic object
puts "# === basic object"
# p Object.superclass
p Object.superclass.superclass