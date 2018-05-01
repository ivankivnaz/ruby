class Renderer
  def render(text_object)
    text = text_object.text
    size = text_object.size_inches
    color = text_object.color
    # render the text ...
  end
end

# expected by renderer
class TextObject
  attr_reader :text, :size_inches, :color
  def initialize(text, size_inches, color)
    @text = text
    @size_inches = size_inches
    @color = color
  end
end

# real object
class BritishTextObject
  attr_reader :string, :size_mm, :colour
  # ...
end


# adapter for real object
class BritishTextObjectAdapter < TextObject
  def initialize(bto)
    @bto = bto
  end

  def text
    return @bto.string
  end

  def size_inches
    return @bto.size_mm / 25.4
  end

  def color
    return @bto.colour
  end
end
