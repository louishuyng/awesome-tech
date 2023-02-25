# frozen_string_literal: true

require './composite_task'
require './make_batter_task'
require './simple_tasks'

composite = CompositeTask.new('Make cake')
composite << MakeBatterTask.new
composite << FillPanTask.new
composite << BakeTask.new
composite << FrostTask.new

puts "Total time required #{composite.time_required}"
puts("Composite[0] time required is #{composite[0].time_required}")
puts("Composite[1] time required is #{composite[1].time_required}")
puts('Composite[1] change to AddDryIngredientsTask')
composite[1] = AddDryIngredientsTask.new
puts("Composite[1] time required is #{composite[1].time_required}")
