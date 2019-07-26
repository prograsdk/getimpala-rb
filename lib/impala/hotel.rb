# frozen_string_literal: true

module Impala
  # Wraps an Impala hotel.
  class Hotel
    # @return [String]
    attr_accessor :id

    # @param [String] id
    def initialize(id)
      @id = id
    end

    # Fetches a hotel guest with a given id.
    #
    # @param id [String]
    # @raise [GuestNotFound]
    #   if a guest with the given id does not exist.
    # @return [Guest]
    def guest(id)
      response = Impala.connection.get("hotel/#{@id}/guests/#{id}")
      Guest.new(response.body[:data])
    rescue ::Faraday::ResourceNotFound
      raise GuestNotFound, "Guest with id #{id} not found"
    end

    # Fetches all bookings
    #
    # @return [Array<Booking>]
    def bookings
      response = Impala.connection.get("hotel/#{@id}/bookings")
      response.body[:data].map { |booking| Booking.new(hotel: self, **booking) }
    end

    # Fetches a booking with a given id.
    #
    # @param id [String, Integer]
    # @raise [BookingNotFound]
    #   if a booking with the passed id does not exist.
    # @return [Booking]
    def booking(id)
      response = Impala.connection.get("hotel/#{@id}/bookings/#{id}")
      Booking.new(hotel: self, **response.body[:data])
    rescue ::Faraday::ResourceNotFound
      raise BookingNotFound, "Booking with id #{id} not found"
    end
  end
end
