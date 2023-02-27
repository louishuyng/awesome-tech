require 'fileutils'
require './base_command'

class CreateFile < Command
  def initialize(path, contents)
    super("Create file: #{path}")
    @path = path
    @contents = contents
  end

  def execute
    f = File.open(@path, 'w')
    f.write(@contents)
    f.close
  end

  def unexecute
    File.delete(@path)
  end
end

class DeleteFile < Command
  def initialize(path)
    super("Delete file: #{path}")
    @path = path
  end

  def execute
    @contents = File.read(@path) if File.exist?(@path)
    File.delete(@path)
  end

  def unexecute
    return unless @contents

    f = File.open(@path, 'w')
    f.write(@contents)
    f.close
  end
end

class CopyFile < Command
  def initialize(source, target)
    super("Copy file: #{source} to #{target}")
    @source = source
    @target = target
  end

  def execute
    FileUtils.copy(@source, @target)
  end

  def unexecute
    @contents = File.read(@target) if File.exist?(@target)
    File.delete(@target)

    f = File.open(@source, 'w')
    f.write(@contents)
    f.close
  end
end

class CompositeCommand < Command
  def initialize
    super('Composite')
    @commands = []
  end

  def add_command(cmd)
    @commands << cmd
  end

  def execute
    @commands.each(&:execute)
  end

  def unexecute
    @commands.reverse.each(&:unexecute)
  end

  def description
    description = ''
    @commands.each do |cmd|
      description += cmd.description + "

"
    end
    description
  end
end

cmds = CompositeCommand.new
cmds.add_command(CreateFile.new('file1.txt', 'hello world'))
cmds.add_command(CopyFile.new('file1.txt', 'file2.txt'))
cmds.add_command(DeleteFile.new('file1.txt'))

cmds.execute
puts(cmds.description)

sleep(3)

puts('--------------------- UNDO ---------------------')
cmds.unexecute
puts('Undo Commands')
