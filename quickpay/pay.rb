require "capybara"
require "selenium/webdriver"

def wait_for_user_action
  puts "Press [enter] to continue."
  gets
end

quickpay_code = "TODO: Replace me"

page = Capybara::Session.new(:selenium)

page.visit("https://www.quickpayportal.com")
page.fill_in("QuickPay Code, Statement ID, or Access Code", with: quickpay_code)
page.click_on("Sign In")

page.check("I accept the QuickPay Terms and Conditions.")
page.click_on("Make a Payment")
page.fill_in("Card number", with: "TODO: Replace me")
page.fill_in("Cardholder name", with: "TODO: Replace me")
page.select("TODO: Replace me (01 - 12)", from: "Expiration date")
page.fill_in("expirationyear", with: "TODO: Replace me (YYYY)")
page.fill_in("Security code", with: "TODO: Replace me")

page.fill_in("Address line 1", with: "TODO: Replace me")
page.fill_in("Address line 2", with: "TODO: Replace me")
page.fill_in("City", with: "TODO: Replace me")
page.select("TODO: Replace me", from: "State")
page.fill_in("ZIP code", with: "TODO: Replace me")

page.click_on("Review Payment")
page.fill_in("emailaddress", with: "TODO: Replace me")

page.click_on("Submit Payment")
