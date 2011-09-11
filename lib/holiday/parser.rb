module Holiday  
  # Extracts the relevant information from strings
  class Parser
    class << self
      def parse(string)
        if string =~ /in/
          w,m,o = weekday(string), month(string), occurrence(string)
          d = wday(w)
          
          { :weekday => w, :wday => d, :month => m, :occurrence => o }          
        else
          string
        end
      end

      def weekday(string)
        (string.split(' ').map(&:downcase) & weekdays).join
      end

      def month(string)
        (string.split(' ').map(&:downcase) & months).join
      end

      def occurrence(string)
        string.scan(/\d/).join.to_i
      end

      def wday(which)
        weekdays.index(which)
      end

      def weekdays
        %W(sunday monday tuesday wednesday thursday friday saturday)
      end

      def months
        %W(january february march april may june july august september october november december)
      end
    end
  end
end