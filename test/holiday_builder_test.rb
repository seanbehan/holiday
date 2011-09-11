require 'helper.rb'

class HolidayTest < Test::Unit::TestCase
  def setup
    Holiday.yaml_file = "#{File.dirname(__FILE__)}/holiday.yml"
    Holiday.country = "united_states"
  end

  def test_builder
    assert Holiday::Builder.build
    assert_kind_of Hash, Holiday::Builder.build

    assert_equal "halloween", Holiday::Builder.build["all hallows eve"]
    assert_equal "labor_day", Holiday::Builder.build["labour day"]
  end
end