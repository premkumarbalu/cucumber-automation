
  When(/^I singed in driver portal with valid credentials$/) do
    step "I enter valid credentials for owner user"
    step "I select continue button"
  end

  And(/^I should see parked time on the driver detail page$/) do
    driver_parked_time = on(DpDriverDetail).txt_parked_time_element.text
    driver_parked_time.nil?. should be_false, "Driver parked time hasn't displayed"
  end

  And(/^I navigated to driver detail page$/) do
    step "I should see the list of driver in all drivers page"
    step "I select random driver in all drivers page"
    step "I should see driver detail page"
  end

  Then(/^I should see driver profile logo$/) do
    on(DpDriverDetail).lnk_all_trips_element.visible?.should be_true, "Driver image hasn't displayed"
  end

  Then(/^I should see all trip link on driver detail page$/) do
    on(DpDriverDetail).lnk_all_trips_element.visible?.should be_true, "All trips link hasn't displayed"
  end

  When(/^I select all trip link$/) do
    on(DpDriverDetail).lnk_all_trips_element.click
  end

  Then(/^I should navigate to view trips page for the selected driver$/) do
    @current_page.wait_until(30, "View Trip page hasn't displayed"){on(DpTripPage).trip_detail_element.visible?}
    on(DpTripPage).trip_detail_element.visible?.should be_true, "View Trip page hasn't displayed"
  end

  Then(/^I should see driver status on the driver detail page$/) do
    driver_status = on(DpDriverDetail).txt_driver_status_element.text
    driver_status.nil?.should be_false, "The driver status hasn't displayed"
  end

  Then(/^I should see following details of the driver$/) do |table|
    table.rows.each do |element|
      error_msg = "#{element} hasn't displayed in driver detail page"
      case element.first
        when 'driver_name'
          on(DpDriverDetail).txt_driver_name_element.nil?.should be_false, error_msg
        when 'vehicle_name'
          on(DpDriverDetail).txt_vehicle_name_element.nil?.should be_false, error_msg
        when 'driver_address'
          on(DpDriverDetail).txt_driver_address_element.nil?.should be_false, error_msg
        when 'driver_status'
          on(DpDriverDetail).txt_driver_status_element.nil?.should be_false, error_msg
      end

    end
  end

  Then(/^I should see the following driver_statistics for last 2 weeks$/) do |table|
   # statistics_time_last_2_weeks = on(DpDriverDetail).total_driver_trips_element.text
   # on(DpDriverDetail).lnk_all_trips_element.click
   # @current_page.wait_until(30, "View Trip page hasn't displayed"){on(DpTripPage).trip_detail_element.visible?}
    table.raw.each do |element|
        case element.first
          when 'total_amount_of_trips'
            total_trip = on(DpDriverDetail).total_driver_trips_element.text
            total_trip.nil?.should be_false, "The total amount of trip hasn't displayed"
          when 'total_drive_time'
             total_driveTime = on(DpDriverDetail).total_hours_element.text
             total_driveTime.nil?.should be_false, "The total drive time hasn't displayed"
          when 'total_distance'
            total_distance = on(DpDriverDetail).total_distance_element.text
            total_distance.nil?.should be_false, "The total drive distance hasn't displayed"
          when 'max_speed'
            driver_max_speed = on(DpDriverDetail).max_speed_element.text
            driver_max_speed.nil?.should be_false, "The total drive distance hasn't displayed"
        end
    end
  end

  And (/^I click logout icon$/) do
    on(DpDriverDetail).logout_btn_element.click
  end

  Then(/^I should see logout confirmation popup message$/) do
    @current_page.wait_until(30, "Confirm pop up message hasn't displayed"){on(SettingsPage).confirm_popup_button_element.visible?}
    on(SettingsPage).confirm_popup_button_element.visible?.should be_true, "Confirm pop up message hasn't displayed"
  end

  And(/^I click confirm button on pop up message$/) do
    on(SettingsPage).confirm_popup_button_element.click
  end

  Then(/^I should see logged out owner login$/) do
    @current_page.wait_until(30, "Owner Login page hasn't displayed"){on(DpHomePage).user_name_element.visible?}
    on(DpHomePage).user_name_element.visible?.should be_true, "Owner Login page hasn't displayed"
  end