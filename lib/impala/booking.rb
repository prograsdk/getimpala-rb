# frozen_string_literal: true

module Impala
  # Wraps the Impala Booking schema: {https://docs.getimpala.com/#bookings}.
  class Booking < Base
    # @return [Hotel]
    attr_accessor :hotel

    # @return [String]
    attr_accessor :id

    # @return [String]
    attr_accessor :reference

    # @return [String]
    attr_accessor :booking_set_id

    # @return [String]
    attr_accessor :rate_plan_id

    # @return [String]
    attr_accessor :market

    # @return [Object]
    attr_accessor :source

    # @return [Object]
    attr_accessor :origin

    # @return [String]
    attr_accessor :channel_manager

    # @return [String]
    attr_accessor :area_id

    # @return [String]
    attr_accessor :requested_area_type_id

    # @return [Integer]
    attr_accessor :adult_count

    # @return [Integer]
    attr_accessor :child_count

    # @return [Integer]
    attr_accessor :infant_count

    # @return [Integer]
    attr_accessor :net_amount

    # @return [Integer]
    attr_accessor :gross_amount

    # @return [Integer]
    attr_accessor :tax_amount

    # @return [String]
    attr_accessor :currency_code

    # @return [Array<String>]
    attr_accessor :guest_ids

    # @return [String]
    attr_accessor :allocation_id

    # @return [Array<String>]
    attr_accessor :company_ids

    # @return [Array<String>]
    attr_accessor :external_references

    # @return [Time]
    attr_reader :created_at

    # @return [Time]
    attr_reader :updated_at

    # @return [Time]
    attr_reader :cancelled_at

    # @return [BookingStatus]
    attr_reader :status

    # @return [AmountBreakdown]
    attr_reader :amount_breakdown

    # @return [Contact]
    attr_reader :contact

    # @return [Time]
    attr_reader :start

    # @return [Time]
    attr_reader :end

    # @return [Float]
    attr_reader :tax_rate

    # @raise [NoMethodError]
    #   if hotel is not defined.
    # @return [Array<Guest>]
    def guests
      @guests ||= guest_ids.map { |guest_id| hotel.guest(guest_id) }
    end

    # @overload created_at=(value)
    #   @param value [Time, String, Interger]
    def created_at=(value)
      @created_at = timestamp(value)
    end

    # @overload updated_at=(value)
    #   @param value [Time, String, Interger]
    def updated_at=(value)
      @updated_at = timestamp(value)
    end

    # @overload cancelled_at=(value)
    #   @param value [Time, String, Interger]
    def cancelled_at=(value)
      @cancelled_at = timestamp(value)
    end

    # @overload tax_rate=(value)
    #   @param value [String, Float]
    def tax_rate=(value)
      @tax_rate = value.to_f
    end

    # @overload start=(value)
    #   @param value [Time, String, Interger]
    def start=(value)
      @start = timestamp(value)
    end

    # @overload end=(value)
    #   @param value [Time, String, Interger]
    def end=(value)
      @end = timestamp(value)
    end

    def status=(value)
      @status = BookingStatus.const_get(value)
    end

    def amount_breakdown=(value)
      @amount_breakdown = AmountBreakdown.new(value)
    end

    def contact=(value)
      @contact = Contact.new(value)
    end
  end
end
