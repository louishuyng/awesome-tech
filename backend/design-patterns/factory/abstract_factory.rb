# frozen_string_literal: true

require './animals'
require './plants'
require './organism_factory'

# Abstract Factory
class Habitat
  def initialize(number_animals, number_plants, organism_factory)
    @organism_factory = organism_factory
    @animals = []
    number_animals.times do |i|
      animal = @organism_factory.new_animal("Animal#{i}")
      @animals << animal
    end

    @plants = []
    number_plants.times do |i|
      plant = @organism_factory.new_plant("Plant#{i}")
      @plants << plant
    end
  end

  def simulate_one_day
    @plants.each(&:grow)
    @animals.each(&:speak)
    @animals.each(&:eat)
    @animals.each(&:sleep)
  end
end

# Concrete Factories
class PondOrganismFactory
  def new_animal(name)
    Frog.new(name)
  end

  def new_plant(name)
    Algae.new(name)
  end
end

class JungleOrganismFactory
  def new_animal(name)
    Tiger.new(name)
  end

  def new_plant(name)
    Tree.new(name)
  end
end

# The important thing about the abstract factory
# is that it encapsulates the knowledge of which product types go together. You can
# express that encapsulation with classes and subclasses
jungle = Habitat.new(1, 4, JungleOrganismFactory.new)
jungle.simulate_one_day

jungle = Habitat.new(1, 4, JungleOrganismFactory.new)
jungle.simulate_one_day

pond = Habitat.new(2, 4, PondOrganismFactory.new)
pond.simulate_one_day

# or you can get to it by storing the class objects
jungle_organism_factory = OrganismFactory.new(Tree, Tiger)
jungle = Habitat.new(1, 4, jungle_organism_factory)
jungle.simulate_one_day

pond_organism_factory = OrganismFactory.new(WaterLily, Frog)
pond = Habitat.new(2, 4, pond_organism_factory)
pond.simulate_one_day
