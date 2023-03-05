# frozen_string_literal: true

require 'find'
require './expression'

class All < Expression
  def evaluate(dir)
    files = []
    Find.find(dir) do |path|
      files << path if File.file?(path)
    end
    files
  end
end
