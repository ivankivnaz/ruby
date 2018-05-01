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

# # real object
# class BritishTextObject
#   attr_reader :string, :size_mm, :colour
#   # ...
# end


# Make sure the original class is loaded
require 'british_text_object'

# Now add some methods to the original class
class BritishTextObject
  def color
    return colour
  end

  def text
    return string
  end

  def size_inches
    return size_mm / 25.4
  end
end
