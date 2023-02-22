# frozen_string_literal: true

require 'test/unit'
require './report'
require './plain_text_formatter'

class TestReport < Test::Unit::TestCase
  def setup
    @report = Report.new(PlainTextFormatter.new)
  end

  def test_report_correct
    puts @report.output_report
    assert_equal expected_text, @report.output_report
  end

  def expected_text
    puts('**** Monthly Report ****')
    text = ['Things are going', 'really, really well.']
    text.each do |line|
      puts(line)
    end
  end
end
