# frozen_string_literal: true

module Impala
  # Base class for Imapala objects.
  class Base
    include Helpers

    # @!method attributes
    #   Returns all attributes of the object.
    #   @return [Hash]

    # @param attributes [Hash]
    def initialize(attributes = {})
      attributes.each do |key, value|
        setter = "#{key}=".to_sym
        send(setter, value) if respond_to? setter
      end

      self.class.define_method :attributes do
        attributes.keys.map { |key| [key, send(key)] }.to_h
      end
    end
  end
end
