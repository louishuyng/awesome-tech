require './animals'
require './habitats'

tony_tiger = Tiger.new('tony')
se_jungle = Jungle.new('southeastern jungle tigers')
se_jungle.add_sub_population(tony_tiger)

puts tony_tiger.parent_population.name
