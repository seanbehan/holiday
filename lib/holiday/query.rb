module Holiday
  # Query finds when a holiday occurrs
  class Query
    class << self
      def find(holiday)
        key = Builder.build[holiday]
        Holiday.country_holidays[key]["when"] # => 1st monday in september
      end
    end
  end
end