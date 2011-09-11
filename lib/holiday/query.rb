module Holiday
  # Query finds when a holiday occurrs
  class Query
    class << self
      def find(holiday)
        holiday_key = Builder.build[holiday]
        Holiday.country_holidays[holiday_key]["when"] # => 1st monday in september
      end
    end
  end
end