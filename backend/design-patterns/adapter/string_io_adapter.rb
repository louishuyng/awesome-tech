# frozen_string_literal: true

# StringIOAdapter is a class that adapts a string to the interface of a file
class StringIOAdapter
  def initialize(string)
    @string = string
    @position = 0
  end

  def getc
    raise EOFError if @position >= @string.length

    ch = @string[@position]
    @position += 1
    ch
  end

  def eof?
    @position >= @string.length
  end
end
