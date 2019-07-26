# frozen_string_literal: true

require 'impala/webhook/base'
require 'impala/webhook/booking_created'

module Impala
  # Helpers for interacting with Impala webhooks
  module Webhook
    class << self
      # @param body [String, Hash]
      # @param signature [String, nil]
      # @return [Impala::Webhook::Base, nil]
      def parse(body, signature = nil)
        return if !signature.nil? && !verify(body, signature)

        body = body_to_hash(body).to_snake_keys.transform_keys(&:to_sym)

        type_to_class(body[:type]).new(
          body[:hotel_id],
          body[:events]
        )
      end

      # Verifies a webhook body according to
      # {https://docs.getimpala.com/#verifying-webhook-authenticity}.
      #
      # @param signature [String]
      #   The `X-Impala-Signature` header sent from Impala.
      # @param body [String, Hash]
      #   The body of the request.
      # @return [Boolean]
      #   true if signature and body matches; false otherwise.
      def verify(signature, body)
        OpenSSL::HMAC.hexdigest(
          'SHA256',
          Impala.configuration.webhook_secret,
          body_to_json(body)
        ) == signature
      end

      private

      # Maps an Impala webhook type to its corresponding class.
      #
      # @param type [String]
      # @raise [KeyError]
      # @return [Impala::Webhook::Base]
      def type_to_class(type)
        { BOOKING_CREATED: BookingCreated }.fetch(type.upcase.to_sym)
      end

      # @param [Hash, String] body
      # @raise [TypeError]
      # @return [String]
      def body_to_json(body)
        case body
        when String
          body
        when Hash
          body.to_json
        else
          raise TypeError
        end
      end

      # @param [Hash, String] body
      # @raise [TypeError]
      # @return [Hash]
      def body_to_hash(body)
        case body
        when String
          JSON.parse(body)
        when Hash
          body
        else
          raise TypeError
        end
      end
    end
  end
end
