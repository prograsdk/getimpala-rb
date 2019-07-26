# frozen_string_literal: true

FactoryBot.define do
  factory :webhook_booking_created, class: Impala::Webhook::BookingCreated,
                                    parent: :webhook_base do
    hotel_id { Faker::Internet.uuid }
    events { [{ new_booking: { id: Faker::Internet.uuid } }] }
  end
end
