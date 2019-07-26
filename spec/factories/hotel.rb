# frozen_string_literal: true

FactoryBot.define do
  factory :hotel, class: Impala::Hotel do
    id { Faker::Internet.uuid }

    initialize_with { new(id) }
  end
end
