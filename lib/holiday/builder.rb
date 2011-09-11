module Holiday
  # Sets up a container for holidays based on keys and alternative holiday names from yaml file.
  class Builder
    class << self
      def build
        return @container if defined?(@container)
        @container = {}
        Holiday.holidays.each do |holiday|
          Holiday.country_holidays[holiday]["as"].split(",").each do |other|
            @container[holiday] = holiday      # yaml key should be looked against as well
            @container[other.strip] = holiday  # natural name, labour day, is a key
          end
        end
        @container
      end
    end
  end
end
