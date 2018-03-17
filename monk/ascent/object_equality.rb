# '=='' method - for checking equality of you own objects

class Numb
  def initialize(value)
    @value = value
  end

  def to_s
    "#{@value}"
  end

  def ==(number)
    puts "self = #{self} vs number = #{number}"
  end
end

p Numb.new(1) == Numb.new(1)

# object equality in ruby core methods
class Item
  attr_reader :item_name, :qty
  def initialize(item_name, qty)
    @item_name = item_name
    @qty = qty
  end
  def to_s
    "Item (#{@item_name}, #{@qty})"
  end
  def ==(other_item)
    self.item_name == other_item.item_name && self.qty == other_item.qty
  end
end

items = [Item.new("abcd", 1), Item.new("abcd", 1), Item.new("abcd", 1)]
p items.uniq

# object's hash - uniq code per object
puts '---- first'
p 1.hash
p "Hello".hash
p "Hello!".hash
p [1,2,3].hash
p({:x => 1, :y => 2}.hash)

puts '---- 2nd'
p 1.hash
p "Hello".hash
p "Hello!".hash
p [1,2,3].hash
p({:x => 1, :y => 2}.hash)

class Item
  def initialize(name)
    @name = name
  end
end

p Item.new("ruby").hash

puts '-' * 20
# using hash and eql? method to get custom object equality

class Item
  attr_reader :item_name, :qty
  
  def initialize(item_name, qty)
    @item_name = item_name
    @qty = qty
  end
  
  def to_s
    "Item (#{@item_name}, #{@qty})"
  end
  
  def hash
    self.item_name.hash ^ self.qty.hash
  end

  def eql?(other_item)
    puts "#eql? invoked"
    @item_name == other_item.item_name && @qty == other_item.qty
  end
  
end

p Item.new("abcd", 1).hash

items = [Item.new("abcd", 1), Item.new("abcd", 1), Item.new("abcd", 1)]
p items.uniq

# wrapping up object equality

# == - comparing STATE values of your object
# hash method - uniq hash codes of your object XORed - depends on state
# eql? - method invoked on objects comporison, e.g. uniq method

# example of methods impementation
class Item
  attr_reader :item_name, :quantity, :supplier_name, :price
  
  def initialize(item_name, quantity, supplier_name, price)
    @item_name = item_name
    @quantity = quantity
    @supplier_name = supplier_name
    @price = price
  end 
  
  def ==(other_item)
    @item_name == other_item.item_name &&
    @quantity == other_item.quantity &&
    @supplier_name == other_item.supplier_name &&
    @price == other_item.price
  end
  
  def eql?(other_item)
    self == other_item
  end
  
  def hash
    @item_name.hash ^ @quantity.hash ^ @supplier_name.hash ^ @price.hash
  end    
end
