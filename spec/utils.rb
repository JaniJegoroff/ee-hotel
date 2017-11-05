require 'httparty'
require 'tenjin'

BASE_URL = 'http://hotel-test.equalexperts.io/'.freeze

module SpecUtils
  class Utils
    class << self
      def get(path)
        HTTParty.get("#{BASE_URL}/#{path}")
      end

      def post(path)
        HTTParty.post("#{BASE_URL}/#{path}")
      end

      def delete(path)
        HTTParty.delete("#{BASE_URL}/#{path}")
      end

      def create_valid_booking
        create_booking('valid_booking_data')
      end

      def create_invalid_booking
        create_booking('invalid_booking_data')
      end

      def create_booking(json)
        path = "#{Dir.pwd}/data/#{json}.json"
        engine = Tenjin::Engine.new(layout: path)
        body = engine.render(path)

        HTTParty.post("#{BASE_URL}/booking",
                      headers: default_headers,
                      body: body,
                      verify: false)
      end

      def delete_booking(id)
        headers = default_headers
        headers['Authorization'] = 'Basic YWRtaW46cGFzc3dvcmQxMjM='
        HTTParty.delete("#{BASE_URL}/booking/#{id}",
                        headers: headers,
                        verify: false)
      end

      def default_headers
        result = Hash.new([])
        result['Accept'] = 'application/json'
        result['Content-Type'] = 'application/json; charset=utf-8'
        result
      end
    end
  end
end
