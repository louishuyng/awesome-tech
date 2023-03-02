# frozen_string_literal: true

require 'drb/drb'

# The MathService class is a simple service that can add two numbers.
class MathService
  def add(a, b)
    a + b
  end
end

math_service = MathService.new
puts 'Server is running at port 3030...'
DRb.start_service('druby://localhost:3030', math_service)
DRb.thread.join
