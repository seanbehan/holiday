require 'helper.rb'

class HolidayTest < Test::Unit::TestCase
    def setup
        Holiday.yaml_file = "test/holiday.yml"
        Holiday.country = "united_states"
    end

    def test_config
        assert "holiday.yml", Holiday.yaml_file
        assert "united_states", Holiday.country
    end

    def test_yaml_load_file
        assert_kind_of Hash, Holiday.yaml
    end

    def test_yaml_country_holiday_hash
        assert Holiday.holidays.include?("christmas"), Holiday.holidays.join(" ")
        assert Holiday.holidays.include?("labor_day"), Holiday.holidays.join(" ")
    end
end