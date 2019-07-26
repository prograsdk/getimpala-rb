# frozen_string_literal: true

module Impala
  # Transforms keys from camel case to snake case.
  class KeyTransformationMiddleware < Faraday::Response::Middleware
    def on_complete(env)
      env[:body] = env[:body].to_snake_keys
    end
  end
end
