require 'selenium-webdriver'
require 'rubygems'
require 'rspec'

driver = Selenium::WebDriver.for:chrome

Given('open the website') do
  driver.navigate.to "https://amazon.com"
  driver.manage.window.maximize
end

Then('user sign up') do
  driver.find_element(:xpath, '//*[@id="nav-link-accountList"]/span[1]').click
  driver.find_element(:id, 'createAccountSubmit').click
  driver.find_element(:id, 'ap_customer_name').send_keys('rizky')
  driver.find_element(:id, 'ap_email').send_keys('rizkymsianturi@gmail.com')
  driver.find_element(:id, 'ap_password').send_keys('pleasehireme')
  driver.find_element(:id, 'ap_password_check').send_keys('pleasehireme')
  driver.find_element(:id, 'continue').click
end

Then('user closing the browser') do
  sleep(5)
end