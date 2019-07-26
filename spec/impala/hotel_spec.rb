# frozen_string_literal: true

RSpec.describe Impala::Hotel do
  let(:hotel) { build(:hotel) }

  describe '#guest' do
    let(:id) { Faker::Internet.uuid }

    context 'valid id' do
      let(:body) { File.read('spec/fixtures/guest.json') }

      before :each do
        stub_request(:get, %r{/hotel/#{hotel.id}/guests/#{id}})
          .and_return(
            body: body,
            headers: { 'Content-Type': 'application/json' }
          )
      end

      it 'returns a Guest' do
        expect(hotel.guest(id)).to be_an(Impala::Guest)
      end
    end

    context 'invalid id' do
      before :each do
        stub_request(:get, %r{/hotel/#{hotel.id}/guests/#{id}})
          .and_return(
            status: 404,
            headers: { 'Content-Type': 'application/json' }
          )
      end

      it 'raises GuestNotFound' do
        expect { hotel.guest(id) }.to raise_error(Impala::GuestNotFound)
      end
    end
  end

  describe '#bookings' do
    let(:body) { File.read('spec/fixtures/bookings.json') }

    before :each do
      stub_request(:get, %r{/hotel/#{hotel.id}/bookings})
        .and_return(
          body: body,
          headers: { 'Content-Type': 'application/json' }
        )
    end

    it 'returns an array of Bookings' do
      expect(hotel.bookings).to all(be_an(Impala::Booking))
    end
  end

  describe '#booking' do
    let(:id) { Faker::Number.number }

    context 'valid id' do
      let(:body) { File.read('spec/fixtures/booking.json') }

      before :each do
        stub_request(:get, %r{/hotel/#{hotel.id}/bookings/#{id}})
          .and_return(
            body: body,
            headers: { 'Content-Type': 'application/json' }
          )
      end

      it 'returns a Booking' do
        expect(hotel.booking(id)).to be_an(Impala::Booking)
      end
    end

    context 'invalid id' do
      before :each do
        stub_request(:get, %r{/hotel/#{hotel.id}/bookings/#{id}})
          .and_return(
            status: 404,
            headers: { 'Content-Type': 'application/json' }
          )
      end

      it 'raises BookingNotFound' do
        expect { hotel.booking(id) }.to raise_error(Impala::BookingNotFound)
      end
    end
  end
end
