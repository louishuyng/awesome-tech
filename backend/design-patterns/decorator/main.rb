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
