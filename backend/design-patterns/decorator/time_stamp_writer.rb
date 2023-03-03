# frozen_string_literal: true

require './writer_decorator'

# This class is responsible for writing to a file
class TimeStampWriter < WriterDecorator
  def write_line(line)
    @real_writer.write_line("#{Time.new}: #{line}")
  end
end
