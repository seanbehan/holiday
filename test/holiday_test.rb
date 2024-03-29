require 'helper.rb'

class HolidayTest < Test::Unit::TestCase
  def setup
    Holiday.yaml_file = "#{File.dirname(__FILE__)}/holiday.yml"
    Holiday.country = "US"
  end

  def test_config
    assert "holiday.yml", Holiday.yaml_file
    assert "US", Holiday.country
  end
  
  def test_yaml_file_loaded
    assert_kind_of Hash, Holiday.yaml
  end
  
  def test_country_holidays
    assert Holiday.holidays.include?("christmas"), Holiday.holidays.join(" ")
    assert Holiday.holidays.include?("labor_day"), Holiday.holidays.join(" ")
  
    Holiday.country = "CA"
    assert_equal "CA", Holiday.country
    assert Holiday.holidays.include?("christmas")
    assert !Holiday.holidays.include?("labor_day")
  end
  
  def test_scan_string
    assert_equal "labour day", Holiday.scan("labour day 2009"), Holiday.scan("hello labour day world")
    assert_equal "turkey day", Holiday.scan("turkey day 2007"), Holiday.scan("turkey day 2007")    
    assert_equal false, Holiday.scan("octoberfest 1990").present?, Holiday.scan("octoberfest 1990")        
  end
  
  def test_holiday_find
    assert_kind_of Date, Holiday.find(:christmas, 2005)
  
    # by keys and by alternate names
    assert_equal "2005-12-25", Holiday.find(:christmas, 2005).to_s # symbol
    assert_equal "2005-12-25", Holiday.find("christmas", 2005).to_s # or string
    assert_equal "2004-09-06", Holiday.find("labor_day", 2004).to_s
    assert_equal "2004-09-06", Holiday.find("labor day", 2004).to_s
    assert_equal "2004-09-06", Holiday.find("labour day", 2004).to_s
    assert_equal "1999-11-25", Holiday.find("thanksgiving", 1999).to_s
    assert_equal "1999-11-25", Holiday.find("turkey day", 1999).to_s
    
  end
  
  def test_year_defaults_to_this_year
    # defaults to current year
    assert_equal "#{Time.now.year}-12-25", Holiday.find("christmas").to_s
    assert_equal "#{Time.now.year}-11-24", Holiday.find("thanksgiving").to_s    
  end
end