# frozen_string_literal: true

module Impala
  # @attr [String] type
  # @attr [String] number
  class Document < Base
    attr_accessor :type, :number
  end
end
