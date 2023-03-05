# frozen_string_literal: true

require './expression'
require './terminals/writable'
require './terminals/all'

class Not < Expression
  def initialize(expression)
    @expression = expression
  end

  def evaluate(dir)
    All.new.evaluate(dir) - @expression.evaluate(dir)
  end
end
