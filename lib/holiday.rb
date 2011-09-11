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
      occurrs = Query.find(holiday)
      parts   = Parser.parse(occurrs)

      timestamp = if parts.kind_of?(Hash)
        occurrance(parts)
      else
        Date.parse([])
      end
    end

    # def occurrance(data)
    #   date = Date.parse("#{data[:month]} 1 #{data[:year]}")
    #   collection = (date.beginning_of_month...date.end_of_month).group_by{ |d| d.wday }
    #   collection[day_to_int(data[:weekday])][data[:occurrance]-1]
    # end

    # Return keys in yaml file
    def holidays
      yaml[country].keys
    end

    def country_holidays
      yaml[country]
    end

    def yaml
      YAML.load_file(yaml_file)["holiday"]
    end
  end
end