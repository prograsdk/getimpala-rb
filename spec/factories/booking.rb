# frozen_string_literal: true

FactoryBot.define do
  factory :booking, class: Impala::Booking do
    id { Faker::Internet.uuid }
    guest_ids { [Faker::Internet.uuid, Faker::Internet.uuid] }
    hotel

    initialize_with { new(hotel, attributes) }
  end
end
