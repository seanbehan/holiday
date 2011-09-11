require 'active_support/time'
require 'yaml'

require "#{File.dirname(__FILE__)}/holiday/builder"
require "#{File.dirname(__FILE__)}/holiday/parser"
require "#{File.dirname(__FILE__)}/holiday/query"

module Holiday
  class << self
    attr_accessor :yaml_file, :country

    def find(holiday,year=nil)
      year = year || Time.now.year
      holiday = holiday.to_s
      occurrs = Query.find(holiday)
      parts   = Parser.parse(occurrs)

      date = if parts.kind_of?(Hash)
        d = Date.parse("#{parts[:month]} 1 #{year}")
        weeks = (d.beginning_of_month..d.end_of_month).group_by{|d| d.wday}
        weeks[parts[:wday]][parts[:occurrance]-1]
      else
        Date.parse([parts, year].join(" "))
      end
    end

    # Returns all holidays
    def all
      Builder.build.keys
    end

    def yaml
      YAML.load_file(yaml_file)["holiday"]
    end

    def holidays
      yaml[country].keys
    end

    def country_holidays
      yaml[country]
    end

  end
end