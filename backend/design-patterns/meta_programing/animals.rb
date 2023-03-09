# frozen_string_literal: true

require './composite_base'

class Tiger < CompositeBase
  member_of(:population)
  member_of(:classification)
  # Lots of code omitted . . .
end

class Tree < CompositeBase
  member_of(:population)
  member_of(:classification)
  # Lots of code omitted . . .
end
