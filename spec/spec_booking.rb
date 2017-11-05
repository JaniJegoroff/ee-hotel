require_relative 'spec_helper'

describe 'Booking' do
  describe 'Success' do
    it 'should return bookings' do
      expect(SpecUtils::Utils.get('booking').code).to eq(200)
    end

    it 'should create booking' do
      response = SpecUtils::Utils.create_valid_booking
      expect(response.code).to eq(200)
      expect(response).to match_response_schema('create_booking')

      data = JSON.parse(response.body)['booking']
      expect(data['firstname']).to eq('aaa')
      expect(data['lastname']).to eq('bbb')
      expect(data['totalprice']).to eq(111)
      expect(data['depositpaid']).to eq(true)
      expect(data['bookingdates']['checkin']).to eq('2018-11-01')
      expect(data['bookingdates']['checkout']).to eq('2018-11-02')
    end

    it 'should delete booking' do
      response = SpecUtils::Utils.create_valid_booking
      booking_id = JSON.parse(response.body)['bookingid']
      response = SpecUtils::Utils.delete_booking(booking_id)
      expect(response.code).to eq(201)
    end
  end

  describe 'Error' do
    it 'should respond 404 Not Found for invalid endpoint' do
      expect(SpecUtils::Utils.get('xxx').code).to eq(404)
    end

    it 'should respond 500 Internal Server Error when creating booking with invalid data' do
      expect(SpecUtils::Utils.create_invalid_booking.code).to eq(500)
    end

    it 'should respond 403 Forbidden when deleting booking without permission' do
      expect(SpecUtils::Utils.delete('booking/xxx').code).to eq(403)
    end

    it 'should respond 405 Method Not Allowed when deleting invalid booking' do
      expect(SpecUtils::Utils.delete_booking('0000').code).to eq(405)
    end
  end
end
