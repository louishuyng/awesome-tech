# frozen_string_literal: true

require './simple_writer'
require './numbering_writer'
require './check_sum_writer'
require './time_stamp_writer'

writer = CheckSumWriter.new(
  TimeStampWriter.new(
    NumberingWriter.new(
      SimpleWriter.new('final.txt')
    )
  )
)

writer.write_line('Hello out there')

# Another way with module
module TimeStampingWriterModule
  def write_line(line)
    super("#{Time.new}: #{line}")
  end
end

module NumberingWriterModule
  attr_reader :line_number

  def write_line(line)
    @line_number ||= 1
    super("#{@line_number}: #{line}")
    @line_number += 1
  end
end

w = SimpleWriter.new('out.txt')
w.extend(NumberingWriterModule)
w.extend(TimeStampingWriterModule)
w.write_line('Hello out there')
