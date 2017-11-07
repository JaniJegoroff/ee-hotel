class BaseScreen
  def initialize(world)
    @world = world
  end

  def visible?
    find_ele(id).displayed?
  end

  def not_visible?
    !visible?
  end

  private

  def find_by_id(id)
    $driver.find_element(:id, id)
  end
  alias find_ele find_by_id

  def find_by_xpath(xpath)
    $driver.find_element(:xpath, xpath)
  end

  def find_all_by_xpath(xpath)
    $driver.find_elements(:xpath, xpath)
  end

  protected

  def method_missing(method, *args, &block)
    # Pass method call to World object
    @world.send(method, *args, &block)
  end
end
