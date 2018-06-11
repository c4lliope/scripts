require "capybara"
require "selenium/webdriver"

page = Capybara::Session.new(:selenium)

def personal_info(type)
  {
    email_address: "TODO: REPLACE_ME",
  }[type]
end

page.visit("https://www.peco.com")
page.click_on("Sign In")
page.fill_in("Username", with: personal_info(:email_address))
page.fill_in("Password", with: password)
page.all("button", text: "Sign In").last.click

page.click_on("Pay Bill")
page.click_on("Pay with Bank Account")

page.fill_in("First Name", with: personal_info(:first_name))
page.fill_in("Last Name", with: personal_info(:last_name))
page.fill_in("Routing Number", with: personal_info(:routing_number))
page.fill_in("Account Number", with: personal_info(:account_number))
page.fill_in("Confirm Account Number", with: personal_info(:account_number))

page.click_on("Continue")
page.click_on("OK")
page.check("IsAggreeToTerms")
page.click_on("Submit")

wait_for_user_action
