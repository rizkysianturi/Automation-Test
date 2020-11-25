require 'selenium-webdriver'
require 'rubygems'
require 'rspec'

driver = Selenium::WebDriver.for:chrome

Given('open the website') do
  driver.navigate.to "https://sandbox-sso.mekari.com/users/sign_in?app_referer=Jurnal"
  driver.manage.window.maximize
end

Then('user do Task') do
  driver.find_element(:id, 'user_email').send_keys('rizkymsianturi@gmail.com')
  driver.find_element(:id, 'user_password').send_keys('pleasehireme')
  driver.find_element(:id, 'new-signin-button').click
  sleep(20)
  driver.find_element(:id, 'vnav-sales-link').click
  driver.find_element(:xpath, '/html/body/div[2]/div[4]/div[5]/header/div/div[2]/div/div/button/span').click
  driver.find_element(:xpath, '/html/body/div[2]/div[4]/div[5]/header/div/div[2]/div/div/ul/li[1]/a').click
  driver.find_element(:id, 'select2-chosen-19').click
  # element = driver.find_elements(:xpath, '/html/body/div[2]/div[4]/div[4]/section/div/div/form/div[2]/div[1]/div/div/div[2]/ul/li/div/a')
  # element.click()
  # driver.find_element(:id, 'person_display_name').send_keys('Joseph M. Simatupang')
  # driver.find_element(:id, 'person_email').send_keys('josephsimatups@gmail.com')
  # driver.find_element(:id, 'person_billing_address').send_keys('Jalan In Aja Dulu')
  # driver.find_element(:id, 'person_phone').send_keys('088456789100')
  # driver.find_element(:id, 'aodc-add').click
  driver.find_element(:name, 'transaction[transaction_date]').send_keys [:control, 'a'], :backspace
  driver.find_element(:name, 'transaction[transaction_date]').send_keys('26/11/2020')
  driver.action.send_keys(:enter).perform
  driver.find_element(:name, 'transaction[due_date]').send_keys [:control, 'a'], :backspace
  driver.find_element(:name, 'transaction[due_date]').send_keys('30/11/2020')
  driver.action.send_keys(:enter).perform
  # driver.find_element(:id, 'select2-drop-mask').click
  # driver.find_element(:id, 'select2-results-20').click
  driver.find_element(:id, 'transaction_transaction_lines_attributes_0_rate').send_keys [:control, 'a'], :backspace
  driver.find_element(:id, 'transaction_transaction_lines_attributes_0_rate').send_keys('70000')
  # driver.find_element(:id, 'dropzoneAdd').click
  element = driver.find_element(:id, 'dropzoneAdd')

  # element.send_keys('..\\Capture.png')

  button = driver.find_element(:id, 'create_button')
  button.click()

end

Then('user close the browser') do
  sleep(5)
end