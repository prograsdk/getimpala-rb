# frozen_string_literal: true

module Impala
  module Webhook
    # BOOKING_CREATED hook
    class BookingCreated < Base
      # @return [Array<Booking>]
      def bookings
        @bookings ||= events.map do |event|
          Booking.new(hotel: hotel, **event[:new_booking])
        end
      end
    end
  end
end
