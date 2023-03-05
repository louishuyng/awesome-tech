# frozen_string_literal: true

require './expression'

class And < Expression
  def initialize(expression1, expression2)
    @expression1 = expression1
    @expression2 = expression2
  end

  def evaluate(dir)
    @expression1.evaluate(dir) & @expression2.evaluate(dir)
  end
end
