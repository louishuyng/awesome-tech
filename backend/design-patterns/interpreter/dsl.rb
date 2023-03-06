# frozen_string_literal: true

require './dsl/backup'
require './dsl/data_source'
require './terminals/all'
require './terminals/file_name'

Dir[File.expand_path('non_terminals/*.rb', File.dirname(__FILE__))].each do |file|
  require file
end

def backup(dir, find_expression = All.new)
  Backup.instance.data_sources << DataSource.new(dir, find_expression)
end

def to(backup_directory)
  Backup.instance.backup_directory = backup_directory
end

def interval(minutes)
  Backup.instance.interval = minutes
end

def file_name(pattern)
  FileName.new(pattern)
end

def except(expression)
  Not.new(expression)
end

eval(File.read('backup.pr'))
Backup.instance.run
