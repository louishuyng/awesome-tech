class Command
  attr_reader :description

  def initialize(description)
    @description = description
  end

  def execute
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
