# frozen_string_literal: true

RSpec.describe Impala::Webhook::BookingCreated do
  let(:webhook) { build(:webhook_booking_created) }

  describe '#bookings' do
    it 'returns an array of bookings' do
      expect(webhook.bookings).to all(be_an(Impala::Booking))
    end
  end
end
