# frozen_string_literal: true

require './task'

class CompositeTask < Task
  def initialize(name)
    super(name)
    @sub_tasks = []
  end

  def total_number_basic_tasks
    total = 0
    @sub_tasks.each { |task| total += task.total_number_basic_tasks }
    total
  end

  def <<(task)
    @sub_tasks << task
    task.parent = self
  end

  def add_sub_task(task)
    @sub_tasks << task
    task.parent = self
  end

  def remove_sub_task(task)
    @sub_tasks.delete(task)
    task.parent = nil
  end

  def [](index)
    @sub_tasks[index]
  end

  def []=(index, new_value)
    @sub_tasks[index] = new_value
  end

  def time_required
    time = 0.0
    @sub_tasks.each { |task| time += task.time_required }
    time
  end
end
