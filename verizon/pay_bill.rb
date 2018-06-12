require "capybara"
require "selenium/webdriver"

def wait_for_user_action
  puts "Press [enter] to continue."
  gets
end

def account_info(website, type)
  raise NotImplementedError
end

page = Capybara::Session.new(:selenium)

page.visit("https://www.verizon.com")
page.click_on("Residential")
page.click_on("Sign In/Register")
page.fill_in("User ID", with: account_info("verizon.com", :username))
page.fill_in("Password", with: account_info("verizon.com", :password))

wait_for_user_action

page.all("a", text: "Pay Bill").last.click
page.click_on("Pay now")
page.click_on("Okay")
