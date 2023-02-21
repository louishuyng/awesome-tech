# frozen_string_literal: true

require 'test/unit'
require './plain_text_report'

class TestReport < Test::Unit::TestCase
  def setup
    @report = PlainTextReport.new
  end

  def test_report_correct
    assert_equal expected_text, @report.output_report
  end

  def expected_text
    puts('**** Monthly Report ****')
    puts
    puts('Things are going')
    puts('really, really well.')
  end
end
