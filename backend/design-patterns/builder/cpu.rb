# frozen_string_literal: true

class CPU
  def initialize(speed)
    @speed = speed
  end

  def turbo
    raise 'Abstract method called'
  end

  def to_s
    puts "CPU Speed: #{@speed}MHz"
  end
end

class BasicCPU < CPU
  def turbo
    0
  end
end

class TurboCPU < CPU
  def turbo
    @speed * 1.5
  end
end
