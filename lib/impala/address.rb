# frozen_string_literal: true

module Impala
  # Wraps Impala address
  #
  # @attr [String] line1
  # @attr [String] line2
  # @attr [String] city
  # @attr [String] postal_code
  # @attr [String] region
  # @attr [String] country_code
  class Address < Base
    attr_accessor :line1, :line2, :city, :postal_code, :region, :country_code
  end
end
