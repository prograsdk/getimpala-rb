# frozen_string_literal: true

module Impala
  # @attr [Boolean] email
  # @attr [Boolean] sms
  # @attr [Boolean] phone
  class ContactByInfo < Base
    attr_accessor :email, :sms, :phone
  end
end
