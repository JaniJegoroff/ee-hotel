module WaitForUtils
  def wait_for
    wait = Selenium::WebDriver::Wait.new(timeout: 5)
    wait.until { yield }
  end
end
