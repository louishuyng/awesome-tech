# frozen_string_literal: true

require 'singleton'

class PackRat
  include Singleton

  def initialize
    @backups = []
  end

  def register_backup(backup)
    @backups << backup
  end

  def run
    threads = []
    @backups.each do |backup|
      threads << Thread.new { backup.run }
    end

    threads.each(&:join)
  end
end
