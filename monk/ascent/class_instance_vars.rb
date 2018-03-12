# class instance vars are avaliable only for class and it's instances,
# but is not shared through inheritance

class FooBar
  @@foo_count = 0

  def self.inc_parent_count
    @@foo_count += 1
  end

  def self.get_parent_count
    @@foo_count
  end
end

class Foo < FooBar
  @foo_count = 0

  def self.inc_count
    @foo_count += 1
  end

  def self.get_count
    @foo_count
  end
end

class Bar < Foo
  @foo_count = 100
end

Foo.inc_count
Bar.inc_count

p Foo.inc_count
p Bar.get_count

print '=' * 20 + "\n"

p Foo.inc_parent_count
p Bar.inc_parent_count
p FooBar.inc_parent_count
p FooBar.get_parent_count