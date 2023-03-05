# frozen_string_literal: true

require './cpu'
# Motherboard class
class Motherboard
  attr_accessor :cpu, :memory_size

  def initialize(cpu = BasicCPU.new(5), memory_size = 1000)
    @cpu = cpu
    @memory_size = memory_size
  end

  def to_s
    puts "#{@cpu}\n"
    puts "Memory size: #{@memory_size}\n"
  end
end
