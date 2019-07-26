# frozen_string_literal: true

module Impala
  # Configuration object
  class Configuration
    # @return [String]
    attr_accessor :api_key

    # @return [String]
    attr_accessor :webhook_secret
  end
end
