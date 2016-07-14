  Given(/^I visit the driver web site as a user$/) do
    visit(DpHomePage)
  end

  When(/^I enter valid credentials for (owner) user$/) do |txt_user|
   case txt_user
     when 'owner'
       @current_page.wait_until(30, "Home page hasn't loaded"){on(DpHomePage).continue_element.visible?}
       on(DpHomePage).login_driver_portal
   end
  end

  And(/^I select continue button$/) do
    on(DpHomePage).continue_element.click
    sleep 2
  end

  Then(/^I should see the list of driver in all drivers page$/) do
    @current_page.wait_until(30, "All drivers page hasn't displayed"){on(DriverListPage).list_of_drivers_element.visible?}
    on(DriverListPage).list_of_drivers_element.visible?.should be_true, "All drivers page hasn't displayed"
  end


  When(/^I enter invalid credentials for (owner) user$/) do |txt_credential|
   case txt_credential
     when 'owner'
       @current_page.wait_until(30, "Home page hasn't loaded"){on(DpHomePage).continue_element.visible?}
       on(DpHomePage).login_with_invalid_credential_for_dp
   end
  end

  Then(/^I should see the error message "(.*?)"$/) do |txt_invalid_credentials|
    @current_page.text.upcase.include?(txt_invalid_credentials.upcase).should be_true, "Error message hasn't displayed for invalid credentials"
  end

  When(/^I select Forgot password$/) do
     @current_page.wait_until(30, "Forgot link hasn't displayed"){on(DpHomePage).lnk_forgot_element.visible?}
     on(DpHomePage).lnk_forgot_element.click
     sleep 2
  end

  Then(/^I should see alert message as (Enter your email to recover your password)$/) do |txt_msg|
     err_msg = "Forgot password page hasn't displayed"
     @current_page.wait_until(30,err_msg ){on(DpHomePage).int_forgot_email_element.visible?}
     @current_page.text.upcase.include?(txt_msg.upcase).should be_true, err_msg
  end

  When(/^I enter valid email id (ownerlogin@example.com)$/) do |txt_email|
     on(DpHomePage).int_forgot_email_element.value = txt_email
  end

  Then(/^I should see alert msg as (You should receive an email with further instructions)$/) do |msg_alert|
    alert_msg = on(DpHomePage).txt_alert_msg_element.text.upcase
    alert_msg.include?(msg_alert.upcase).should be_true, "forgot password alert message hasn't displayed"
  end