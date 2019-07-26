# frozen_string_literal: true

FactoryBot.define do
  factory :guest, class: Impala::Guest do
    id { Faker::Internet.uuid }
    title { Faker::Name.prefix }
    first_name { Faker::Name.first_name }
    middle_name { Faker::Name.middle_name }
    last_name { Faker::Name.last_name }
    sex_code { [0, 1, 2].sample }
    emails { rand(0..3).times { Faker::Internet.email } }
    date_of_birth { Faker::Date.birthday(min_age: 18).to_time.to_i }
    contact_by { { email: true } }
    addresses do
      [{ line1: Faker::Address.street_name,
         city: Faker::Address.city }]
    end
    opt_ins { { marketing: true } }
    documents { [{ number: Faker::IDNumber.valid }] }
    loyalty_programs { [{ code: Faker::String.random }] }
  end
end
