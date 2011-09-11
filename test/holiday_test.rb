require 'helper.rb'

class HolidayTest < Test::Unit::TestCase
  def setup
    Holiday.yaml_file = "#{File.dirname(__FILE__)}/holiday.yml"
    Holiday.country = "united_states"
  end

  def test_config
    assert "holiday.yml", Holiday.yaml_file
    assert "united_states", Holiday.country
  end

  def test_yaml_file_loaded
    assert_kind_of Hash, Holiday.yaml
  end

  def test_country_holidays
    assert Holiday.holidays.include?("christmas"), Holiday.holidays.join(" ")
    assert Holiday.holidays.include?("labor_day"), Holiday.holidays.join(" ")

    Holiday.country = "canada"
    assert Holiday.holidays.include?("christmas")
    assert !Holiday.holidays.include?("labor_day")
  end

end