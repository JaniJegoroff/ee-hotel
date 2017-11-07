require 'selenium-webdriver'

$driver = Selenium::WebDriver.for(:chrome)
$driver.navigate.to('http://hotel-test.equalexperts.io/')
