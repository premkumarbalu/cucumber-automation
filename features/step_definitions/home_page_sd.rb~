  Given(/^I visit the web site as a owner$/) do
    visit(DpHomePage)
  end

  When(/^I enter valid credentials$/) do
    
    @current_page.wait_until(30, "Home page hasn't loaded"){on(DpHomePage).continue_element.visible?}
     on(DpHomePage).login_driver_portal
  end

  #Then(/^I should see the list of driver in all drivers page$/) do
  #  @current_page.wait_until(40, "All drivers page hasn't displayed"){on(AllDrivers).list_of_drivers_element.visible?}
  #  on(AllDrivers).list_of_drivers_element.visible?.should be_true, "All drivers page hasn't displayed"
  #end



  When(/^I navigate to the owner portal page$/) do
    step "I enter valid credentials"
    step "I should see the list of driver in all drivers page"
  end


  And(/^I should see following icons in driver detail page:$/) do |table|
    table.rows.each do |element|
      message = "#{element} hasn't displayed in all drivers page"
      case element
        when 'driver_detail'
          on(DpDriverDetail).driver_details_icon_element.visible?.should be_true, message
        when 'view_trips'
          on(DpDriverDetail).view_trips_icon_element.visible?.should be_true, message
        when 'driver_score'
          on(DpDriverDetail).driver_score_icon_element.visible?.should be_true, message
        when 'vehicle health'
          on(DpDriverDetail).vehicle_health_icon_element.visible?.should be_true, message
        when 'driver_limit_settings'
          on(DpDriverDetail).driver_limit_setting_icon_element.visible?.should be_true, message
        when 'driver_alerts'
          on(DpDriverDetail).driver_alerts_icon_element.visible?.should be_true, message
        when 'reports'
          on(DpDriverDetail).lnk_report_element.visible?.should be_true, message
        when 'system_settings'
          on(DpDriverDetail).lnk_settings_element.visible?.should be_true, message
        when 'logout'
          on(DpDriverDetail).lnk_logout_element.visible?.should be_true, message
      end
    end
  end








