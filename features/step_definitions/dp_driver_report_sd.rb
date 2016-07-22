
  When(/^I navigated to driver reports page$/) do
    #step "I navigated to driver detail page"
    on(DpDriverDetail).navigate_with_driver_score_page
    on(DpDriverDetail).driver_reports_element.click
  end

  Then(/^I should see driver reports page$/) do
    on(ReportsPage).driver_report_detail_element.visible?.should be_true, "Report Details page haven't displayed"
  end

  When(/^I click (trip|vehicle_health|driving_alerts|driver_behaviors) reports$/) do |report_type|
    case report_type
      when 'trip'
         on(ReportsPage).trip_report_element.click
      when 'vehicle_health'
        on(ReportsPage).vehicle_health_report_element.click
      when 'driving_alerts'
        on(ReportsPage).driving_alerts_element.click
      when 'driver_behaviors'
        on(ReportsPage).driver_behaviors_element.click
    end
  end

  Then(/^I should see the following different type of driver reports$/) do |table|
    table.rows.each do |element|
      case element.first
        when 'select the drivers for trip reports'
              on(ReportsPage).select_all_drivers
        when 'generating report based on the FROM & TO dates'
                on(ReportsPage).generate_report_based_on_from_and_to_dates
        when 'show each trip individually'
            #default selection
              #on(ReportsPage).select_all_element.click
        when 'combine all data for drivers'
          on(ReportsPage).select_combine_all_data_element.click
      end
      on(ReportsPage).show_report_element.click
      @current_page.wait_until(30, "Results haven't displayed"){on(ReportsPage).table_results_element.visible?}
      on(ReportsPage).table_results_element.visible?.should be_true, "Results haven't displayed"
    end

  end

  Then(/^I should see the different types of vehicle_health_report$/) do |table|
    table.rows.each do |element|
      case element.first
        when 'select all driver vehicle health report'
          on(ReportsPage).select_all_drivers
        when 'generating report based on report type'
          on(ReportsPage).select_report_type
        when 'generating report based on the FROM & TO dates'
          on(ReportsPage).set_date_from_vehicle_report_element.click
          sleep 2
          on(ReportsPage).select_date_elements.sample.click
          on(ReportsPage).set_date_to_vehicle_report_element.click
          sleep 2
          on(ReportsPage).select_date_elements.sample.click
      end
      on(ReportsPage).show_report_element.click
      @current_page.wait_until(60, "Results haven't displayed"){on(ReportsPage).table_results_element.visible?}
      on(ReportsPage).table_results_element.visible?.should be_true, "Results haven't displayed"
    end
  end

  Then(/^I should see the different types of driving_alerts_report$/) do |table|
    table.rows.each do |element|
      case element.first
        when 'select all driver alerts Report'
          on(ReportsPage).select_all_drivers
        when 'generating report based on type of alert'
          on(ReportsPage).select_type_of_alert
        when 'generating report based on the FROM & TO dates'
          on(ReportsPage).set_from_date_alerts_element.click
          sleep 2
          on(ReportsPage).select_date_elements.sample.click
          #on(ReportsPage).set_to_date_alerts_element.click
          sleep 2
          #@current_page.scroll.to :bottom
          #on(ReportsPage).select_date_elements.sample.click
      end
      on(ReportsPage).show_report_element.click
      @current_page.wait_until(60, "Results haven't displayed"){on(ReportsPage).table_results_element.visible?}
      on(ReportsPage).table_results_element.visible?.should be_true, "Results haven't displayed"
    end

  end

  Then(/^I should see the following types of driver_behaviors_report$/) do |table|
    table.rows.each do |element|
      case element.first
        when 'select all driver behaviors report'
          on(ReportsPage).select_all_drivers
        when 'generating report based on the FROM & TO dates'
          on(ReportsPage).set_from_date_behaviors_element.click
          on(ReportsPage).select_date_elements.sample.click
          on(ReportsPage).set_to_date_behaviors_element.click
          on(ReportsPage).select_date_elements.sample.click

      end
    end
    on(ReportsPage).show_report_element.click
    @current_page.wait_until(60, "Results haven't displayed"){on(ReportsPage).table_results_element.visible?}
    on(ReportsPage).table_results_element.visible?.should be_true, "Results haven't displayed"
  end