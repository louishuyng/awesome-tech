class BritishTextObject
  attr_reader :string, :size_mm, :colour

  def initialize(text, size_mm, color)
    @text = text
    @size_mm = size_mm
    @color = color
  end
end
