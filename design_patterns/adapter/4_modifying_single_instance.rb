bto = BritishTextObject.new('hello', 50.8, :blue)

# adding methods to singleton class of bto
class << bto
  def color
    colour
  end

  def text
    string
  end

  def size_inches
    return size_mm/25.4
  end
end

# another way of adding methods to singleton class of bto
def bto.color
  colour
end

def bto.text
  string
end

def bto.size_inches
  return size_mm/25.4
end
