# frozen_string_literal: true

require './composite_task'
require './make_batter_task'
require './simple_tasks'

class MakeCakeTask < CompositeTask
  def initialize
    super('Make cake')
    add_sub_task(MakeBatterTask.new)
    add_sub_task(FillPanTask.new)
    add_sub_task(BakeTask.new)
    add_sub_task(FrostTask.new)
  end
end
