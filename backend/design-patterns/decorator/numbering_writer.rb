# frozen_string_literal: true

require './simple_writer'
require './writer_decorator'

# This class is used to decorate the writer object
class NumberingWriter < WriterDecorator
  def initialize(real_writer)
    super(real_writer)
    @line_number = 1
  end

  def write_line(line)
    @real_writer.write_line("#{@line_number}: #{line}")
    @line_number += 1
  end
end
