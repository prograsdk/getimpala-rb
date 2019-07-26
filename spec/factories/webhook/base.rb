# frozen_string_literal: true

FactoryBot.define do
  factory :webhook_base, class: Impala::Webhook::Base do
    hotel_id { Faker::Internet.uuid }

    initialize_with { new(hotel_id, {}) }
  end
end
