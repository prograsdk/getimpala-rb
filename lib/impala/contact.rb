# frozen_string_literal: true

module Impala
  # @attr [String] type
  # @attr [Object] data
  # @attr [String] id
  class Contact < Base
    attr_accessor :type, :data, :id
  end
end
