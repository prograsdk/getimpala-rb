# frozen_string_literal: true

RSpec.describe Impala::Webhook::Base do
  let(:webhook) { build(:webhook_base) }

  describe '#hotel' do
    it 'returns a Hotel' do
      expect(webhook.hotel).to be_an(Impala::Hotel)
    end
  end
end
