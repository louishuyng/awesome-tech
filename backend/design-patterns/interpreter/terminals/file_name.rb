# frozen_string_literal: true

require 'find'
require './expression'

class FileName < Expression
  def initialize(pattern)
    @pattern = pattern
  end

  def evaluate(dir)
    files = []
    Find.find(dir) do |p|
      next unless File.file?(p)

      name = File.basename(p)
      files << p if File.fnmatch(@pattern, name)
    end
    files
  end
end
