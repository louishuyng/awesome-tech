# frozen_string_literal: true

require './motherboard'
# Computer class
class Computer
  attr_accessor :display, :motherboard
  attr_reader :drives

  def initialize(display = :crt, motherboard = Motherboard.new, drives = [])
    @motherboard = motherboard
    @drives = drives
    @display = display
  end

  def to_s
    puts "Display: #{@display}\n"
    puts "Motherboard: \n#{@motherboard}"

    drives.each do |drive|
      puts "Drive: #{drive}\n"
    end
  end
end

class LaptopComputer < Computer
  def initialize(motherboard = Motherboard.new, drives = [])
    super(:lcd, motherboard, drives)
  end
end

class DesktopComputer < Computer
  def initialize(motherboard = Motherboard.new, drives = [])
    super(:crt, motherboard, drives)
  end
end
