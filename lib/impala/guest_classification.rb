# frozen_string_literal: true

module Impala
  # Wrapper for Impala guest classification enumeration:
  # {https://docs.getimpala.com/#guest-classifications}.
  class GuestClassification
    extend ::Impala::Enum

    enum :paymaster_account, :blacklist, :media, :loyalty_program, :complained,
         :returning, :staff, :management, :ip, :vip, :problematic, :cashlist,
         :disabled, :military, :marketing_subscribed, :smoker, :other
  end
end
