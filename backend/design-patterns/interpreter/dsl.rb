# frozen_string_literal: true

require './dsl/packrat'
require './dsl/backup'
require './terminals/all'
require './terminals/file_name'

Dir[File.expand_path('non_terminals/*.rb', File.dirname(__FILE__))].each do |file|
  require file
end

def file_name(pattern)
  FileName.new(pattern)
end

def except(expression)
  Not.new(expression)
end

eval(File.read('backup.pr'))
PackRat.instance.run
