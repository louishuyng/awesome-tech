# frozen_string_literal: true

require './computer'
require './cpu'
require './drive'
# The Builder pattern is used to separate the construction of a complex object
class ComputerBuilder
  attr_reader :computer

  def turbo(speed = 50)
    @computer.motherboard.cpu = TurboCPU.new(speed)
  end

  def memory_size=(size_in_mb)
    @computer.motherboard.memory_size = size_in_mb
  end
end

class DesktopBuilder < ComputerBuilder
  def initialize
    @computer = DesktopComputer.new
  end

  attr_writer :display

  def add_cd(writer = false)
    @computer.drives << Drive.new(:cd, 760, writer)
  end

  def add_dvd(writer = false)
    @computer.drives << Drive.new(:dvd, 4000, writer)
  end

  def add_hard_disk(size_in_mb)
    @computer.drives << Drive.new(:hard_disk, size_in_mb, true)
  end
end

class LaptopBuilder < ComputerBuilder
  def initialize
    @computer = LaptopComputer.new
  end

  def display=(display)
    raise 'Laptop display must be lcd' unless display == :lcd
  end

  def add_cd(writer = false)
    @computer.drives << LaptopDrive.new(:cd, 760, writer)
  end

  def add_dvd(writer = false)
    @computer.drives << LaptopDrive.new(:dvd, 4000, writer)
  end

  def add_hard_disk(size_in_mb)
    @computer.drives << LaptopDrive.new(:hard_disk, size_in_mb, true)
  end
end

builder = DesktopBuilder.new
builder.turbo(20)
builder.add_cd(true)
builder.add_dvd
builder.add_hard_disk(100_000)
puts builder.computer

puts '============='

builder = LaptopBuilder.new
builder.turbo(10)
builder.add_cd(false)
builder.add_dvd
builder.add_hard_disk(200_000)

puts builder.computer
