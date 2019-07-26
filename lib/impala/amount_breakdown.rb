# frozen_string_literal: true

module Impala
  # @attr [String] duration
  # @attr [String] start
  # @attr [Integer] net_amount
  # @attr [Integer] gross_amount
  # @attr [Integer] tax_amount
  # @attr [String] tax_rate
  class AmountBreakdown < Base
    attr_accessor :duration, :start, :net_amount, :gross_amount, :tax_amount,
                  :tax_rate
  end
end
