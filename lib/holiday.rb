require 'yaml'

module Holiday

  # Configuration
  class << self
    attr_accessor :yaml_file, :country

    def find(holiday,year)
    end

    # Return keys in yaml file
    def holidays
      yaml["holiday"][country].keys
    end

    def yaml
      YAML.load_file(yaml_file)
    end

  end
end
