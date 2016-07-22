
   And(/^I navigated to settings page$/) do
     @current_page.wait_until(30, "Settings page hasn't displayed"){on(DriverListPage).lnk_settings_element.visible?}
     on(DriverListPage).lnk_settings_element.click
   end

   Then(/^I should see driver settings page$/) do
     sleep 2
    on(SettingsPage).user_settings_element.visible?.should be_true, "Settings page hasn't displayed"
   end

   When(/^I modify the following details for user information$/) do |table|
     table.rows.each do |element|
       case element.first
         when 'name'
            on(SettingsPage).user_name_element.value = 'Owner'
         when 'lastname'
           on(SettingsPage).last_name_element.value = 'Testing'
         when 'email'
           on(SettingsPage).email_id_element.value = 'ownerlogin@example.com'
         when 'phone'
           on(SettingsPage).phone_number_element.value = '0123456789'
         when 'password'
           on(SettingsPage).txt_password_element.value = 'Modus-123'
           on(SettingsPage).txt_password_confi_element.value = 'Modus-123'
       end
     end
   end

   Then(/^I should see the (Updated successfully) pop up message$/) do |success_msg|
      on(SettingsPage).update_button1_element.click
      @current_page.wait_until(40, "Update successfully toast message hasn't displayed"){on(SettingsPage).successful_msg_element.visible?}
       msg_txt = on(SettingsPage).successful_msg_element.text
      success_msg.upcase.eql?(msg_txt.upcase).should be_true, "Your profile haven't modified successfully"

      on(SettingsPage).update_button2_element.click
      @current_page.wait_until(40, "Update successfully toast message hasn't displayed"){on(SettingsPage).successful_msg_element.visible?}
      msg_txt = on(SettingsPage).successful_msg_element.text
      success_msg.upcase.eql?(msg_txt.upcase).should be_true, "Your profile haven't modified successfully"
   end

  When(/^I navigate to users-vechiles page to create new dispatch user$/) do
    on(DriverListPage).lnk_settings_element.click
    sleep 2
    on(DriverListPage).lnk_user_vechile_element.click
  end

  And(/^I select create user$/) do
    on(DriverListPage).lnk_create_dispatch_user_element.click
  end

  When(/^I enter mandatory fields to create dispatch user$/) do
    on(DriverListPage).create_a_dispatch_user
  end


  And(/^I select create button$/) do
    on(DriverListPage).btn_create_element.click
  end

  Then(/^I should see successful creation of dispatch user$/) do
    on(DriverListPage).lnk_user_vechile_element.click
    sleep 2
    @current_page.text.upcase.include?('MODUS TESTING').should be_true, "dispatch user hasn't created"
  end

  When(/^I create new dispatch user$/) do
    step "I navigate to users-vechiles page to create new dispatch user"
    step "I select create user"
    @txt_email_id = on(DriverListPage).create_a_dispatch_user
    #step "I enter mandatory fields to create dispatch user"
    step "I select create button"
    step "I should see successful creation of dispatch user"
  end

  Then(/^I can able to login with new dispatch user credentials$/) do
    on(DpDriverDetail).logout_btn_element.click
    on(SettingsPage).confirm_popup_button_element.click
    @current_page.wait_until(30, "Loging Page hasn't displayed" ){on(DpHomePage).user_name_element.visible?}
    @current_page.navigate_to "https://fleetdev.modusgo.com/#/drivers"
    on(DpHomePage).user_name_element.value = @txt_email_id
    on(DpHomePage).password_element.value = 'Password1234'
    on(DpHomePage).continue_element.click
    step "I should see the list of driver in all drivers page"
  end

  When(/^I navigate to users-vechiles page$/) do
    on(DriverListPage).lnk_settings_element.click
    sleep 2
    on(DriverListPage).lnk_user_vechile_element.click
  end

  And(/^I delete dispatch user$/) do
    on(SettingsPage).delete_button_element.click
    @current_page.wait_until(30, "Confirm pop up message hasn't displayed"){on(SettingsPage).confirm_popup_button_element.visible?}
    on(SettingsPage).confirm_popup_button_element.click
  end

  Then(/^I should see toast message (Deleted Successfully)$/) do |toast_msg|
    @current_page.wait_until(30, "Deleted successfully toast message hasn't displayed"){on(SettingsPage).successful_msg_element.visible?}
    success_msg = on(SettingsPage).successful_msg_element.text
    success_msg.upcase.eql?(toast_msg.upcase).should be_true, "Your profile haven't modified successfully"
  end

   And(/^I edit driver informations$/) do
     on(SettingsPage).edit_driver_informations
   end

   Then(/^I should see toast message (Updated Successfully)$/) do |success_msg|
     @current_page.wait_until(40, "Update successfully toast message hasn't displayed"){on(SettingsPage).successful_msg_element.visible?}
     msg_txt = on(SettingsPage).successful_msg_element.text
     success_msg.upcase.eql?(msg_txt.upcase).should be_true, "Your profile haven't modified successfully"
   end

   And(/^I edit vehicle informations$/) do
     on(SettingsPage).update_vehicle_details
   end

   When(/^I navigate to settings-groups page$/) do
     @current_page.wait_until(30, "Settings page hasn't displayed"){on(DriverListPage).lnk_settings_element.visible?}
     on(DriverListPage).lnk_settings_element.click
     sleep 2
     on(SettingsPage).lnk_settings_group_element.click
   end

   And(/^I create new group$/) do
     @current_page.wait_until(30, "Create new group button hasn't displayed"){on(SettingsPage).create_new_group_element.visible?}
     on(SettingsPage).create_new_group_element.click
     on(SettingsPage).create_new_group
   end

   And(/^I should see vehicle count in setting-groups page$/) do
     on(SettingsPage).lnk_settings_group_element.click
      txt_vehicle_count = on(SettingsPage).vehicle_count_element.text
     txt_vehicle_count.nil?.should be_false, "Vehicle count hasn't displayed"
   end

   And(/^I click Show link$/) do
     on(SettingsPage).lnk_show_element.click
   end

   Then(/^I shoulds see list of users in that group$/) do
     @current_page.wait_until(30, "Search result hasn't displayed"){on(DriverListPage).list_of_drivers_element.visible?}
     search_option = on(DriverListPage).search_option_element.text
     search_option.nil?.should be_false ,"Serach keyword hasn't displayed in driver list page"
     on(DriverListPage).list_of_drivers_element.visible?.should be_true, "Search result hasn't displayed"
   end

   And(/^I click edit icon in the group$/)do
     on(SettingsPage).edit_group_element.click
   end

   And(/^I modify group name and color$/) do
     on(SettingsPage).create_new_group
   end

   And(/^I click delete icon in the group$/) do
     on(SettingsPage).delete_button_element.click
     @current_page.wait_until(30, "Confirm pop up message hasn't displayed"){on(SettingsPage).confirm_popup_button_element.visible?}
     on(SettingsPage).confirm_popup_button_element.click
   end

   When(/^I navigate to driving-limits page$/) do
      on(DriverListPage).lnk_settings_element.click
      sleep 2
      on(SettingsPage).driving_limit_element.click
   end

   And(/^I click on "(.*?)"$/) do |txt_limit_setup|
     @current_page.wait_until(30,"Driver limit hasn't displayed" ){on(SettingsPage).driver_phone_usage_event_alerts_element.visible?}
     case txt_limit_setup
       when  'Max_speed_limit'
          on(SettingsPage).driver_max_speed_element.click
       when 'Time_of_day_limit'
          on(SettingsPage).driver_time_of_day_limit_element.click
       when 'Mileage_Limit'
         on(SettingsPage).driver_milage_limit_element.click
       when 'Phone_Usage_events_Alerts'
         on(SettingsPage).driver_phone_usage_event_alerts_element.click
     end
   end

   And(/^I tap on "(.*?)"$/) do |txt_icon|
     sleep 2
     case txt_icon
       when 'Add_New_setup'
         on(SettingsPage).add_new_setup_element.click
         sleep 2
         on(SettingsPage).select_drivers_element.click
         on(SettingsPage).btn_update_button_element.click
       when 'update_max_speed'
           on(SettingsPage).edit_icon_element.click
           sleep 2
           on(SettingsPage).select_drivers_element.click
           on(SettingsPage).btn_update_button_element.click
       when 'select_driver'
         on(SettingsPage).select_drivers_element.click
     end
   end

   When(/I navigate to trip_tags page$/)do
     on(DriverListPage).lnk_settings_element.click
     sleep 2
     on(SettingsPage).trip_tags_icon_element.click
   end

   And(/^I click on "(.*?)" in trip tags page$/) do |txt_trp_tag_func|
     case  txt_trp_tag_func
       when 'create new Trip tags'
         @current_page.wait_until(30, "Add New trip link hasn't displayed"){on(SettingsPage).add_new_trip_tag_element.visible?}
         on(SettingsPage).add_new_trip_tag_element.click
         on(SettingsPage).create_new_trip_tag
       when 'edit tag name and colors'
         on(SettingsPage).edit_update_new_trip
       when 'delete trip tags'
         on(SettingsPage).delete_created_new_trip
     end
   end
   When(/^I navigate to support page$/) do
     on(DriverListPage).lnk_settings_element.click
     sleep 2
     on(SettingsPage).support_icon_element.click
   end

   And(/^I enter mandatory details$/) do
     on(SettingsPage).subject_element.value = 'Testing'
     on(SettingsPage).description_element.value = 'Testing'
   end

   And(/^I send questions$/) do
     on(SettingsPage).send_button_element.click
   end

   Then(/^I should see (Thank you!) message$/) do |tnx_msg|
     @current_page.wait_until(30,"Thank you message hasn't displayed"){on(SettingsPage).tnx_message_element.visible?}
     msg_txt = on(SettingsPage).tnx_message_element.h1_element.text
     msg_txt.upcase.include?(tnx_msg.upcase).should be_true, "Thank you message hasn't displayed"
   end