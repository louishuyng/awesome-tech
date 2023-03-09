# frozen_string_literal: true

require './composite_base'

class Jungle < CompositeBase
  composite_of(:population)
  # Lots of code omitted . . .
end

class Species < CompositeBase
  composite_of(:classification)
  # Lots of code omitted . . .
end
