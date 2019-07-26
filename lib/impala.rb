# frozen_string_literal: true

require 'faraday'
require 'faraday_middleware'
require 'plissken'
require 'json'

require 'impala/helpers'
require 'impala/enum'

require 'impala/base'
require 'impala/address'
require 'impala/amount_breakdown'
require 'impala/booking'
require 'impala/booking_status'
require 'impala/configuration'
require 'impala/contact'
require 'impala/contact_by_info'
require 'impala/document'
require 'impala/guest'
require 'impala/guest_classification'
require 'impala/hotel'
require 'impala/key_transformation_middleware'
require 'impala/loyality_program'
require 'impala/opt_in_info'
require 'impala/webhook'

require 'impala/base_error'
require 'impala/booking_not_found'
require 'impala/guest_not_found'
require 'impala/version'

# Interacts with the Imapala web API.
module Impala
  BASE_URL = 'https://api.getimpala.com/v2/hotel/'

  class << self
    # @return [Configuration]
    attr_accessor :configuration

    # @yieldparam [Configuration]
    #
    # @example
    #   Impala.configure do |config|
    #     config.api_key = 'myapikey'
    #   end
    def configure
      @configuration ||= Configuration.new
      yield @configuration
    end

    # @return [Faraday::Connection]
    def connection
      @connection ||= Faraday.new BASE_URL do |conn|
        conn.authorization :Bearer, @configuration.api_key
        conn.request :json

        conn.use KeyTransformationMiddleware
        conn.response :json, content_type: 'application/json',
                             parser_options: { symbolize_names: true }
        conn.response :raise_error

        conn.adapter Faraday.default_adapter
      end
    end
  end
end
