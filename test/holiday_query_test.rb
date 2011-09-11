require 'helper.rb'

class HolidayTest < Test::Unit::TestCase
  def setup
    Holiday.yaml_file = "#{File.dirname(__FILE__)}/holiday.yml"
    Holiday.country = "united_states"
  end

  def test_query
    assert_kind_of String, Holiday::Query.find("christmas")
    assert_equal "december 25th", Holiday::Query.find("christmas")
    assert_equal "october 31st", Holiday::Query.find("all hallows eve"), Holiday::Query.find("all hallows eve")
    assert_equal "1st monday in september", Holiday::Query.find("labour day"), Holiday::Query.find("labour day")
    assert_equal Holiday::Query.find("labour day"), Holiday::Query.find("labor_day"), Holiday::Query.find("labour day")
  end
end