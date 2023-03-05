Dir[File.expand_path('non_terminals/*.rb', File.dirname(__FILE__))].each do |file|
  require file
end

def all
  All.new
end

def bigger(size)
  Bigger.new(size)
end

def name(pattern)
  FileName.new(pattern)
end

def except(expression)
  Not.new(expression)
end

def writable
  Writable.new
end

def file_name(pattern)
  FileName.new(pattern)
end

puts ((bigger(2000) & except(writable)) | file_name('*.mp3')).evaluate('test_dir')
