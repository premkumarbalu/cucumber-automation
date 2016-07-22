
  And(/^I navigated to driver score page$/) do
      #step "I navigated to driver detail page"
      on(DpDriverDetail).navigate_with_driver_score_page
      on(DpDriverDetail).driver_score_icon_element.click
  end

  Then(/^I should see driver score page$/) do
   #current_month =  Date.today.strftime("%B")
    @current_page.wait_until(30, "Your Score Page hasn't displayed"){on(ScorePage).txt_start_date_element.visible?}
    start_date = on(ScorePage).txt_start_date_element.text
    start_date.nil?. should be_false, "Start date hasn't displayed"
  end

  When(/^I click "(.*?)"$/) do |txt_lnk|
    case txt_lnk
      when 'score_breakdown'
          on(ScorePage).breakdown_element.click
      when 'usage_breakdown'
          on(ScorePage).time_and_road_usage_element.click
      when 'behaviors'
          on(ScorePage).txt_behaviors_element.click
    end
  end

  Then(/^I should see the following "(.*?)" in driver score page$/) do |txt_details|
    error_msg = "#{txt_details} hasn't displayed"
    case txt_details
      when 'score_calendar'
        on(ScorePage).score_statistics_element.visible?.should be_true, error_msg
        on(ScorePage).grade_info_element.visible?.should be_true, error_msg
        on(ScorePage).txt_start_date_element.visible?.should be_true, error_msg
        on(ScorePage).your_score_status_element.visible?.should be_true, error_msg
      when 'score_status'
        sleep 2
        on(ScorePage).score_status_element.visible?.should be_true, error_msg
        on(ScorePage).score_chart_element.visible?.should be_true, error_msg
        on(ScorePage).score_grade_element.visible?.should be_true, error_msg
      when 'time_on_road_charts'
        sleep 2
        on(ScorePage).usage_statistics_element.visible?.should be_true, error_msg
        on(ScorePage).time_summary_element.visible?.should be_true, error_msg
        on(ScorePage).road_settings_element.visible?.should be_true, error_msg
        on(ScorePage).road_type_element.visible?.should be_true, error_msg
        on(ScorePage).time_of_day_element.visible?.should be_true, error_msg
      when 'road_and_environment_behaviors'
        sleep 2
        on(ScorePage).txt_behaviors_element.visible?.should be_true, error_msg
        on(ScorePage).txt_behaviors_table_element.visible?.should be_true, error_msg
        on(ScorePage).index_element.visible?.should be_true, error_msg
    end
  end


  #DRIVER ALERTS

  And(/^I navigated to driver alert page$/) do
    #step "I navigated to driver detail page"
    on(DpDriverDetail).navigate_with_driver_score_page
    on(DpDriverDetail).driver_alerts_icon_element.click
  end

  Then(/^I should see the count displayed under each alert icon$/) do
     on(ScorePage).get_alert_count_of_under_each_alert_icon
  end

  And(/^I click alert icon drop town button$/) do
     on(ScorePage).select_left_arrow_of_all_the_alert
  end
  Then(/^I should see the display all the times for that alert$/) do
    on(ScorePage).verify_alert_timings
  end

  When(/^I select (Show Trip)$/) do |txt_show_trip|
   sleep 5
    on(ScorePage).show_trip_elements.sample.click
  end

  Then(/^I should navigate to view trips page$/) do
    @current_page.wait_until(30, "View Trip page hasn't displayed"){on(DpTripPage).trip_detail_element.visible?}
    on(DpTripPage).trip_detail_element.visible?.should be_true, "View Trip page hasn't displayed"
  end

  When(/^I select (start|end) date$/) do |txt_date|
    case txt_date
      when 'start'
        sleep 2
        on(ScorePage).start_date_element.click
        sleep 2
        on(ScorePage).select_date_elements.sample.click
        sleep 2
      when 'end'
        on(ScorePage).end_date_element.click
        sleep 2
        on(ScorePage).select_date_elements.sample.click
        sleep 2
    end

  end

  Then(/^I should see all alert details$/) do
    on(ScorePage).all_alert_event_element.visible?.should be_true, "Alert event haven't displayed" rescue on(ScorePage).no_result_element.visible?.should be_true, "No result msg hasn't displayed"
  end


