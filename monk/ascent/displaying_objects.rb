# puts vs p
class Item
  def inspect
    "Result of inspect"
  end
end

# puts - fires objects's to_s method, p - inspect

puts Item.new
puts Item.new.to_s
p Item.new

# inspect vs to_s
class Item2
  def initialize(item_name, qty)
    @item_name = item_name
    @qty = qty
  end
end

item = Item2.new("a",1)

puts item
p item