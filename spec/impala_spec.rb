# frozen_string_literal: true

RSpec.describe Impala do
  describe '#configure' do
    let(:api_key) { Faker::Internet.uuid }
    let(:webhook_secret) { Faker::Internet.uuid }

    it 'sets Configuration options' do
      Impala.configure do |config|
        config.api_key = api_key
        config.webhook_secret = webhook_secret
      end

      expect(Impala.configuration).to have_attributes(
        api_key: api_key,
        webhook_secret: webhook_secret
      )
    end
  end
end
