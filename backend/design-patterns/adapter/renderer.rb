# frozen_string_literal: true

require './text_object'
require './british_text_object'

# Renderer is a class that renders text objects
class Renderer
  def initialize(text_object)
    @text = text_object.text
    @size = text_object.size_inches
    @color = text_object.color
  end

  def to_s
    puts 'Rendering text'
    puts "Text: #{@text}"
    puts "Size Inches: #{@size}"
    puts "Color: #{@color}"
  end
end

# can try to open class and add new method
# class BritishTextObject
#   def color
#     colour
#   end
#
#   def text
#     string
#   end
#
#   def size_inches
#     size_mm / 25.4
#   end
# end

puts Renderer.new(TextObject.new('Hello', 12, 'red'))

bto = BritishTextObject.new('Hello', 25, 'blue')
class << bto
  def color
    colour
  end

  def text
    string
  end

  def size_inches
    size_mm / 25.4
  end
end
puts Renderer.new(bto)
