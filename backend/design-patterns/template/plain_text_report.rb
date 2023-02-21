# frozen_string_literal: true

require './report'

class PlainTextReport < Report
  def output_start; end

  def output_head
    puts("**** #{@title} ****")
    puts
  end

  def output_line(line)
    puts(line)
  end
end

PlainTextReport.new.output_report
