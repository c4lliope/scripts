require "capybara"
require "selenium/webdriver"

page = Capybara::Session.new(:selenium)

page.visit("https://www.peco.com")

page.click_on("Register here")
page.find(".acsCloseButton").click
page.first("a", text: "Residential or Business").find("span").click

def wait_for_user_action
  puts "Press [enter] to continue."
  gets
end

wait_for_user_action

def personal_info(type)
  {
    email_address: "TODO: REPLACE_ME",
  }[type]
end

page.fill_in("Username (Email Address):", with: personal_info(:email_address))
page.fill_in("Confirm Username:", with: personal_info(:email_address))

def generate_password
  puts "What password wouldd you like to use?"
  wait_for_user_action.strip
end

password = generate_password
page.fill_in("Password:", with: password)
page.fill_in("Confirm Password:", with: password)

def check_email_for_confirmation_link
  puts "Please check your email for a confirmation link."
  wait_for_user_action
end

check_email_for_confirmation_link
