Given(/^I am on Booking screen$/) do
  wait_for { booking_screen.visible? }
  @count = booking_screen.number_of_bookings
end

Given(/^I have created booking$/) do
  booking_screen.create_default_booking
  @count = booking_screen.number_of_bookings
end

When(/^I enter booking details$/) do
  booking_screen.enter_firstname('jj')
  booking_screen.enter_surname('jj')
  booking_screen.enter_price('222')
  booking_screen.enter_checkin('2018-11-01')
  booking_screen.enter_checkout('2018-11-02')
end

When(/^I save booking$/, :save, on: :booking_screen)
When(/^I delete booking$/, :delete, on: :booking_screen)

Then(/^new booking should be created$/) do
  wait_for { booking_screen.number_of_bookings.eql?(@count + 1) }
end

Then(/^booking should be deleted$/) do
  wait_for { booking_screen.number_of_bookings.eql?(@count - 1) }
end
