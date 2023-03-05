# frozen_string_literal: true

# Drive class
class Drive
  attr_reader :type, :size, :writable # either :hard_disk, :cd or :dvd # in MB # true if this drive is writable

  def initialize(type, size, writable)
    @type = type
    @size = size
    @writable = writable
  end

  def to_s
    result = "#{@type} drive #{@size}MB"
    result += ' (writable)' if @writable
    result
  end
end

class LaptopDrive < Drive
  def initialize(type, size, writable)
    super(type, size, writable)
  end

  def to_s
    result = 'Laptop '
    result += super
  end
end
