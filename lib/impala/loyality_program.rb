# frozen_string_literal: true

module Impala
  # @attr [String] code
  # @attr [String] membership_number
  # @attr [Time] member_since
  class LoyalityProgram < Base
    attr_reader :member_since
    attr_accessor :code, :membership_number

    def member_since=(member_since)
      @member_since = timestamp(member_since)
    end
  end
end
