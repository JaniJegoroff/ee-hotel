require_relative 'base_screen'

class BookingScreen < BaseScreen
  def id
    'bookings'
  end

  def save
    save_button.click
  end

  def delete
    delete_button.click
  end

  def enter_firstname(name)
    firstname_field.send_keys(name)
  end

  def enter_surname(name)
    surname_field.send_keys(name)
  end

  def enter_price(price)
    price_field.send_keys(price)
  end

  def enter_deposit
    deposit_field.click
  end

  def enter_checkin(date)
    checkin_field.send_keys(date)
  end

  def enter_checkout(date)
    checkout_field.send_keys(date)
  end

  def number_of_bookings
    delete_buttons.count
  end

  def create_default_booking
    enter_firstname('aa')
    enter_surname('bb')
    enter_price('111')
    enter_checkin('2018-11-01')
    enter_checkout('2018-11-02')
    save
  end

  private

  def save_button
    find_by_xpath("//input[@type='button'][@value=' Save ']")
  end

  def delete_button
    find_by_xpath("//input[@type='button'][@value='Delete']")
  end

  def delete_buttons
    find_all_by_xpath("//input[@type='button'][@value='Delete']")
  end

  def firstname_field
    find_ele('firstname')
  end

  def surname_field
    find_ele('lastname')
  end

  def price_field
    find_ele('totalprice')
  end

  def deposit_field
    find_ele('depositpaid')
  end

  def checkin_field
    find_ele('checkin')
  end

  def checkout_field
    find_ele('checkout')
  end
end
