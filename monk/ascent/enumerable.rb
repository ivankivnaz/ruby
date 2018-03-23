# === calling enumerable returns enumerator object
p [5, 3].each

# === example
enumerator = [3, 7, 14].each
enumerator.each { |e| puts e + 1 }

# === map with index implementation
class Array
  def map_with_index(&block)
    self.each_with_index.map(&block)
  end
end

# === Hash also includes Enumerable module
# example of usage key value + index
{:locke => "4", :hugo => "8"}.each_with_index do |kv, i| 
  puts "#{kv} -- #{i}"
end

# === map for transformation
def map_value
	[3, 7, 14, 15, 22, 41].map { |e| e + 1 }
end

p map_value

# === mapping keys
def hash_keys(hash)
	hash.map { |pair| pair.first }
end

# === inject
[4, 8, 15, 16, 23, 42].inject(0) do |accumulator, iterated|
  accumulator += iterated
  accumulator
end

# inject using each
def custom_inject(array, default = nil)
  accumulator = default || array[0]
  
  array.each do |element|
    accumulator = accumulator + element
  end
  
  accumulator
end

p custom_inject([4, 8, 15, 16, 23, 42], 0)

# hash from array using inject
[4, 8, 15, 16, 23, 42].inject({}) { |a, i| a.update(i => i) }

# occurences method - counts number of simillar items in an array
def occurrences(str)
	str.scan(/\w+/).inject(Hash.new(0)) do |build, word| 
      build[word.downcase] +=1
      build
	end
end

# === usefull boolean enumerable methods
[4, 8, 15, 16, 23, "42"].any? { |e| e.class == String }
{:locke => 4, :hugo => 8}.any? { |candidate| candidate[1] > 4 }
{:locke => 4, :hugo => 8}.any? { |candidate, number| number < 4 }

# Island implementation
class Island
  def initialize(candidates)
    @candidates = candidates
  end
  
  def survive?
    @candidates.none? { |c| c == "Esau" }
  end
  
  def safe?
    @candidates.all? { |c| c == "Jack" }
  end
end

# array methods like for sets - union, intersection, difference
union_example = ["a", "b", "a"] | ["c", "c"]
p union_example

intersection_example = ["a", "b", "a"] & ["c", "c"]
p intersection_example

array_difference = [1,2,3, 1,2,3] - [1]
p array_difference

# === order out of stock example
class Order
  GIFT_ITEMS = [Item.new(:big_white_tshirt), Item.new(:awesome_stickers)]
  OUT_OF_STOCK_ITEMS = [Item.new(:ssd_harddisk)]

  def initialize(order)
    @order = order || []  
    puts @order
  end
  
  def final_order
    # fix this method to get the tests to pass.
    @order = @order - OUT_OF_STOCK_ITEMS + GIFT_ITEMS
  end
end

customer_order = Order.new([Item.new(:fancy_bag),Item.new(:ssd_harddisk)])

p customer_order.final_order