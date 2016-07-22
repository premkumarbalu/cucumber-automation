
  When(/^I navigated to driver view trips page$/) do
    #step "I navigated to driver detail page"
    on(DpDriverDetail).navigate_with_driver_score_page
    @current_page.wait_until(30, "All Link hasn't displayed"){on(DpDriverDetail).view_trips_icon_element.visible?}
    on(DpDriverDetail).view_trips_icon_element.click
    @current_page.wait_until(30, "View trips page hasn't displayed"){on(DpTripPage).trip_detail_element.visible?}
  end

  Then(/^I should see the following details on view trips page$/) do |table|
    table.rows.each do |element|
      case element.first
        when 'driver_trips'
         driver_trip = on(DpTripPage).txt_trip_elements.sample.text
         driver_trip.empty?.should be_false, "Driver trips hasn't not displayed"
        when 'trip_start_stop_time'
          driver_trip_time = on(DpTripPage).txt_trip_time_elements.sample.text
          driver_trip_time.empty?.should be_false, "Driver trips hasn't not displayed"
        when 'driver_score'
          driver_trip_score = on(DpTripPage).txt_trip_time_elements.sample.text
          driver_trip_score.empty?.should be_false, "Driver score hasn't not displayed"
      end
    end
  end

  And(/^I updated Add Tag$/) do
       on(DpTripPage).trip_tag_elements[1].click
  end

  Then(/^I should see updated tag info on the page$/) do
    on(DpTripPage).update_tag
  end

  And(/^I select checkbox next to the date$/) do
    @current_page.wait_until(30, "Trips date field hasn't displayed"){on(DpTripPage).check_box_day_toggle_elements.sample.visible?}
    on(DpTripPage).check_box_day_toggle_elements.sample.click
  end

  Then(/^I should see all trips are highlighted for the day$/) do
   sleep 5
    on(DpTripPage).div_elements(:class => 'selected').sample.enabled?.should be_true, "Trips haven't highlighted for the day"
  end

  And(/^I select random trip on view trips page$/) do
    on(DpTripPage).txt_trip_elements.sample.click
  end

  Then(/^I should see the following details of the trip$/) do |table|
    table.rows.each do |element|
      error_msg = "#{element} hasn't displayed"
      case element.first
        when 'trip_distance'
          on(DpTripPage).txt_mileage_element.visible?.should be_true, error_msg
        when 'trip_event'
          on(DpTripPage).txt_event_element.visible?.should be_true, error_msg
        when 'trip_max_speed'
          on(DpTripPage).txt_max_speed_element.visible?.should be_true, error_msg
        when 'trip_avg_speed'
          on(DpTripPage).txt_avg_speed_element.visible?.should be_true, error_msg
        when 'trip_score'
          on(DpTripPage).txt_score_element.visible?.should be_true, error_msg
        when 'trip_fuel'
          on(DpTripPage).txt_fuel_element.visible?.should be_true, error_msg
      end
    end

  end