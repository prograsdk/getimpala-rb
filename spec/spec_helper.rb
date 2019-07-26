# frozen_string_literal: true

require 'simplecov'

SimpleCov.start do
  add_filter '/spec/'
end

if ENV['CI']
  require 'codecov'

  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

require 'bundler/setup'
require 'webmock/rspec'
require 'faker'
require 'factory_bot'
require 'impala'

RSpec.configure do |config|
  config.example_status_persistence_file_path = '.rspec_status'

  config.disable_monkey_patching!

  config.include FactoryBot::Syntax::Methods

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before :suite do
    FactoryBot.find_definitions
  end

  config.before :each do
    Impala.configure do |imp|
      imp.api_key = Faker::Internet.uuid
    end
  end
end
