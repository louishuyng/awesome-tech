# frozen_string_literal: true

class Task
  attr_reader :name
  attr_accessor :parent

  def initialize(name)
    @name = name
    @parent = nil
  end

  def time_required
    0.0
  end

  def total_number_basic_tasks
    1
  end
end
