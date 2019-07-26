# frozen_string_literal: true

module Impala
  # Wraps the Imapala Guest schema: {https://docs.getimpala.com/#guests}.
  class Guest < Impala::Base
    # @return [String]
    attr_accessor :id

    # @return [String]
    attr_accessor :title

    # @return [String]
    attr_accessor :first_name

    # @return [String]
    attr_accessor :middle_name

    # @return [String]
    attr_accessor :last_name

    # @return [Integer]
    attr_accessor :sex_code

    # @return [Array<String>]
    attr_accessor :emails

    # @return [Array<String>]
    attr_accessor :phone_numbers

    # @return [String]
    attr_accessor :language_code

    # @return [String]
    attr_accessor :nationality_code

    # @return [String]
    attr_accessor :place_of_birth

    # @return [String]
    attr_accessor :notes

    # @return [Array<Address>]
    attr_reader :addresses

    # @return [Array<LoyalityProgram>]
    attr_reader :loyalty_programs

    # @return [Time]
    attr_reader :date_of_birth

    # @return [Array<Document>]
    attr_reader :documents

    # @return [OptInInfo]
    attr_reader :opt_ins

    # @return [ContactByInfo]
    attr_reader :contact_by

    # @return [Time]
    attr_reader :created_at

    # @return [Time]
    attr_reader :updated_at

    def contact_by=(value)
      @contact_by = ContactByInfo.new(value)
    end

    def opt_ins=(value)
      @opt_ins = Document.new(value)
    end

    def date_of_birth=(value)
      @date_of_birth = timestamp(value)
    end

    def documents=(value = [])
      @documents = value.map { |document| Document.new(document) }
    end

    def addresses=(value = [])
      @addresses = value.map { |address| Address.new(address) }
    end

    def loyalty_programs=(value = [])
      @loyalty_programs = value.map do |loyalty_program|
        LoyalityProgram.new(loyalty_program)
      end
    end

    def created_at=(value)
      @created_at = timestamp(value)
    end

    def updated_at=(value)
      @updated_at = timestamp(value)
    end
  end
end
