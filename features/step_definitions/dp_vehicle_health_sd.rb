
  And(/^I navigated to vehicle health page$/) do
    #step "I navigated to driver detail page"
    on(DpDriverDetail).navigate_with_driver_score_page
    on(DpDriverDetail).vehicle_health_icon_element.click
    @current_page.wait_until(30, "Vehicle health page hasn't displayed"){on(VehicleHealthPage).txt_vehicle_overview_element.visible?}
  end

  Then(/^I should see the following details on vehicle health page$/) do |table|
    table.rows.each do |element|
      error_message = "#{element.first} hasn't displayed"
      case element.first
        when 'vehicle_overview'
          on(VehicleHealthPage).txt_vehicle_overview_element.visible?.should be_true, error_message
        when 'vehicle-info'
          on(VehicleHealthPage).txt_vehicle_info_element.visible?.should be_true, error_message
        when 'vehicle-details'
          on(VehicleHealthPage).txt_vehicle_details_element.visible?.should be_true, error_message
        when 'vehicle_maintenances'
          on(VehicleHealthPage).txt_vehicle_maintenances_element.visible?.should be_true, error_message
      end
    end
  end

  Then(/^I should see the following details for scheduled maintenance$/) do |table|
    @current_page.wait_until(30, "Vehicle health page hasn't displayed"){on(VehicleHealthPage).txt_past_service_element.visible?}
    table.rows.each do |element|
      error_message = "#{element.first} hasn't displayed"
      case element.first
        when 'Past Services'
          past_service = on(VehicleHealthPage).txt_past_service_element.text
          element.first.upcase.include?(past_service.upcase).should be_true, error_message
        when 'Next Service'
          next_service = on(VehicleHealthPage).txt_next_service_element.text
          element.first.upcase.include?(next_service.upcase).should be_true, error_message
        when 'Future Services'
          future_service = on(VehicleHealthPage).txt_future_service_element.text
          element.first.upcase.include?(future_service.upcase).should be_true, error_message
      end
    end
  end

  And(/^I create your own schedule maintenance$/) do
    on(VehicleHealthPage).create_your_own_maintenance
  end

  Then(/^I should see the own schedule maintenance$/) do
    on(VehicleHealthPage).txt_future_service_element.click
  end

  And(/^I navigated to driver limit settings page$/) do
    step "I navigated to driver detail page"
    on(DpDriverDetail).driver_limit_setting_icon_element.click
  end

  Then(/^I should see each limit to be turned on$/) do
    on(VehicleHealthPage).turn_on_each_limit
  end