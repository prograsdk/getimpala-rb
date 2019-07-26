# Impala

[![CircleCI](https://circleci.com/gh/prograsdk/impala_rb.svg?style=svg)](https://circleci.com/gh/prograsdk/impala_rb)
[![codecov](https://codecov.io/gh/prograsdk/impala-rb/branch/master/graph/badge.svg)](https://codecov.io/gh/prograsdk/impala-rb)

> Under development

## Usage

First, configure Impala to use your API key

```ruby
Impala.configure do |config|
  config.api_key = # Your secret API key here ...
end
```

You are now set up to interact with the Impalal web API.
Start by creating a new hotel object.

```ruby
hotel = Impala::Hotel.new(hotel_id)
```

Now, you can get and create guests, bookings and whatever Impala provides.

```ruby
booking = hotel.booking(booking_id)
guests = booking.guests
```
