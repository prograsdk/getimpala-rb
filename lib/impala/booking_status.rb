# frozen_string_literal: true

module Impala
  # Wraps Impala booking statuses:
  # {https://docs.getimpala.com/#booking-statuses}.
  class BookingStatus
    extend ::Impala::Enum

    enum :expected, :no_show, :cancelled, :checked_in, :checked_out, :tranfered,
         :other
  end
end
