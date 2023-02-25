# frozen_string_literal: true

require './task'

class AddDryIngredientsTask < Task
  def initialize
    super('Add dry ingredients')
  end

  def time_required
    1.0             # 1 minute to add flour and sugar
  end
end

class MixTask < Task
  def initialize
    super('Mix that batter up!')
  end

  def time_required
    3.0             # Mix for 3 minutes
  end
end

class AddLiquidTask < Task
  def initialize
    super('Add liquid!')
  end

  def time_required
    2.0             # Liquid for 2 minutes
  end
end

class FillPanTask < Task
  def initialize
    super('Fill Pan')
  end

  def time_required
    3.0
  end
end

class BakeTask < Task
  def initialize
    super('Bake cake!')
  end

  def time_required
    5.0
  end
end

class FrostTask < Task
  def initialize
    super('Frost cake!')
  end

  def time_required
    4.0
  end
end
