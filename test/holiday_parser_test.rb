require 'helper.rb'

class HolidayTest < Test::Unit::TestCase
  def setup
    Holiday.yaml_file = "#{File.dirname(__FILE__)}/holiday.yml"
    Holiday.country = "united_states"
  end

  def test_parser_parse
    assert_kind_of Hash, Holiday::Parser.parse("1st monday in june")
    parts = {:weekday => "thursday", :occurrance => 2, :month => "october"}
    assert_equal parts,  Holiday::Parser.parse("2nd thursday in october"), Holiday::Parser.parse('2nd thursday in october')
    assert_equal "december 25th", Holiday::Parser.parse("december 25th")
  end

  def test_parser_wday
    assert_equal 0, Holiday::Parser.wday("sunday")
    assert_equal 1, Holiday::Parser.wday("monday")
    assert_equal 2, Holiday::Parser.wday("tuesday")
    assert_equal 3, Holiday::Parser.wday("wednesday")
    assert_equal 4, Holiday::Parser.wday("thursday")
    assert_equal 5, Holiday::Parser.wday("friday")
    assert_equal 6, Holiday::Parser.wday("saturday")
  end

  def test_parser_weekday
    assert_equal "monday", Holiday::Parser.weekday("today is monday")
    assert_equal "friday", Holiday::Parser.weekday("thank goodness it's Friday")
  end

  def test_parser_month
    assert_equal "january", Holiday::Parser.month("january is the first month of the year")
    assert_equal "october", Holiday::Parser.month("halloween is a holiday that occurrs in october")
    assert_equal "december", Holiday::Parser.month("christmas is in December")
  end

  def test_parser_occurrance
    assert_equal 1, Holiday::Parser.occurrance("i'm looking for the number 1")
    assert_equal 4, Holiday::Parser.occurrance("i love the 4th of july")
  end
end