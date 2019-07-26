# frozen_string_literal: true

module Impala
  module Webhook
    # Base class for Impala webhooks
    class Base
      # @return [String]
      attr_accessor :hotel_id

      # @return [Array<Hash>]
      attr_accessor :events

      # @param [String] hotel_id
      # @param [Array<Hash>] events
      def initialize(hotel_id, events)
        @hotel_id = hotel_id
        @events = events
      end

      # @return [Hotel]
      def hotel
        @hotel ||= Hotel.new(@hotel_id)
      end
    end
  end
end
