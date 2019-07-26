# frozen_string_literal: true

module Impala
  # @attr [Boolean] market_research
  # @attr [Boolean] third_party
  # @attr [Boolean] marketing
  # @attr [Boolean] misc
  class OptInInfo < Base
    attr_accessor :market_research, :third_party, :marketing, :misc
  end
end
