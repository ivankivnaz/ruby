# === object references
puts "# === object references"
a = [1,2,3]
b = a
b << 4

p a
p b

# === cloning
puts "# === cloning"
a = [1,2,3]
b = a.clone
b << 4

p a
p b

# === changing object example
puts "# === chaning object example"
foo = "foo"
foos = [foo]
foo = foo.upcase
p foos

bar = "bar"
bars = [bar]
bar.upcase!
p bars

# === freezing an object
puts "# === freezing an object"
begin
  a = "test"
  a.freeze
  a << "change"
rescue => e
  puts e
end

# changing variable reference to another object is valid
# freeze is invoke only on object itself
a = [1,2,3,4]
a.freeze
a = [1,2,3]
p a

# frozen clone
class Object
  def frozen_clone
    self.clone.freeeze
  end
end
