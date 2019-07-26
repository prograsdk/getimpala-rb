# frozen_string_literal: true

RSpec.describe Impala::Webhook do
  describe '#verify' do
    let(:webhook_secret) { Faker::Internet.uuid }
    let(:body) { { data: {} }.to_json }

    before :each do
      Impala.configure do |config|
        config.webhook_secret = webhook_secret
      end
    end

    context 'signature is valid' do
      let(:signature) do
        OpenSSL::HMAC.hexdigest('SHA256', webhook_secret, body)
      end

      it 'parses string body' do
        expect(Impala::Webhook.verify(signature, body)).to be true
      end

      it 'parses hash body' do
        expect(Impala::Webhook.verify(signature, JSON.parse(body))).to be true
      end

      it 'raises TypeError if body type cannot be parsed' do
        expect do
          Impala::Webhook.verify(signature, 100)
        end.to raise_error(TypeError)
      end
    end

    context 'signature is invalid' do
      let(:signature) { Faker::Internet.uuid }

      it 'return false' do
        expect(Impala::Webhook.verify(signature, body)).to be false
      end
    end
  end

  describe '#parse' do
    context 'known type' do
      let(:body) { File.read('spec/fixtures/webhook/booking_created.json') }

      it 'returns a new webhook object' do
        expect(Impala::Webhook.parse(body)).to be_an(
          Impala::Webhook::BookingCreated
        )
      end
    end

    context 'unknown type' do
      it 'raises KeyError' do
        expect { Impala::Webhook.parse(type: 'Test') }.to raise_error(KeyError)
      end
    end
  end
end
