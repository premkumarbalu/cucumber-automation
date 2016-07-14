  Given(/^I visit the web site as a admin user$/) do
   visit(DpHomePage)
   @current_page.navigate_to "https://fleetdev.modusgo.com/management"
  end

  When(/^I enter valid admin credentials$/) do
    on(DpHomePage).login_management_website
  end

  Then(/^I should see the management portal home page$/) do
     @current_page.wait_until(30,"Add New Order link hasn't visible" ){on(NewOrder).lnk_add_new_order_element.visible?}
     on(NewOrder).lnk_add_new_order_element.visible?.should be_true, "Add New Order link hasn't visible"
  end

  When(/^I select add new order$/) do
    on(NewOrder).lnk_add_new_order_element.click
  end

  And(/^I enter mandatory details to create new order$/) do
    @current_page.wait_until(30, "New order page hasn't displayed"){on(NewOrder).txt_meid_element.visible?}
    on(NewOrder).create_new_order
  end

  And(/^I select save order button$/) do
    on(NewOrder).btn_save_order_element.click
  end

  Then(/^I should see (new order created) alert message$/) do |alert_txt|
    on(NewOrder).txt_alert_success_element.visible?.should be_true, "New order hasn't created"
    alert_msg = on(NewOrder).txt_alert_success_element.text
    alert_msg.upcase.include?(alert_txt.upcase).should be_true, "New order hasn't created"
  end

  When(/^I select random owner profile in management portal$/) do
    debugger
    on(NewOrder).lnk_login_elements.sample.click
    BrowserHelper.switch_to_second_window(@current_page)
  end