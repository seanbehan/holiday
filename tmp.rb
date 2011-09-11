require "#{File.dirname(__FILE__)}/lib/holiday"

Holiday.yaml_file = "#{File.dirname(__FILE__)}/test/holiday.yml"
Holiday.country = "united_states"

# puts Holiday::Builder.build
# puts Holiday::Builder.build["all hallows eve"]
# puts Holiday::Query.find("all hallows eve")
