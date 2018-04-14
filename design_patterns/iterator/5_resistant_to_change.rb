class ArrayIterator
  def initialize(array)
    @array = Array.new(array)
    @index = 0
  end

  def has_next?
    @index < @array.length
  end

  def item
    @array[@index]
  end

  def next_item
    value = @array[@index]
    @index += 1
    value
  end
end

def change_resistant_for_each_element(array)
  copy = Array.new(array)
  i = 0
  while i < copy.length
    yield(copy[i])
    i += 1
  end
end
