# frozen_string_literal: true

FactoryBot.define do
  factory :address, class: Impala::Address do
    guest
    line1 { Faker::Address.street_name }
    city { Faker::Address.city }
    postal_code { Faker::Address.zip }
    region { Faker::Address.state }
    country_code { Faker::Address.country_code }

    initialize_with { new(guest, attributes) }
  end
end
