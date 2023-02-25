# frozen_string_literal: true

class Task
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def time_required
    0.0
  end
end
