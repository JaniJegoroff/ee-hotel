#
# Provides instances to page objects
#
module ScreenFactory
  def booking_screen
    @booking_screen ||= BookingScreen.new(self)
  end
end
