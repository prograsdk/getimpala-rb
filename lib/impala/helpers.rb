# frozen_string_literal: true

module Impala
  # Helper methods for Impala objects
  module Helpers
    private

    # Creates Time object from timestamp
    #
    # @param [String, Integer, Time] stamp
    # @raise [TypeError]
    # @return [Time]
    def timestamp(stamp)
      case stamp
      when Time
        stamp
      when String
        timestamp(stamp.to_i)
      when Integer
        Time.at(stamp)
      else
        raise TypeError, "Cannot create Time from #{stamp}"
      end
    end
  end
end
