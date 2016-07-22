class ReportsPage

  include PageObject

    div            :driver_report_detail,                            :class => 'reports-detail'
    button         :show_report,                                     :class => 'btn-default'
    text_field     :set_date_from,                                   :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/div/div[2]/div[2]/div[1]/div/div/div/input"
    text_field     :set_date_to,                                     :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/div/div[2]/div[2]/div[2]/div/div/div/input"
    divs           :select_date,                                     :class => 'datepicker__day'
    span           :select_all,                                      :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/div/div[2]/div[1]/div/ul/li[1]/span"

   #Trip Report
   span             :trip_report,                                    :class => 'SF-DrivingLimits'
   checkboxes       :select_drivers,                                 :class => 'driver-select-box'
   table            :table_results,                                  :class => 'reports-data'
   checkbox         :select_combine_all_data,                        :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/div/div[2]/div[2]/div[3]/div/div[1]/div/input"
  #vehicle_health
   span             :vehicle_health_report,                          :class => 'SF-Diagnostics'
   #div              :select_report_type1,                            :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/div/div[2]/div[1]/div[1]/div/div/div/span[1]"
   divs             :select_options,                                 :class => 'Select-option'
   text_field       :set_date_from_vehicle_report,                   :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/div/div[2]/div[1]/div[2]/div[1]/div/div/div/input"
   text_field       :set_date_to_vehicle_report,                     :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/div/div[2]/div[1]/div[2]/div[2]/div/div/div/input"
   #div              :select_report_type2,                            :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/div/div[2]/div[1]/div[2]/div/div/div/span[1]"

  #driving_alerts
  div              :driving_alerts,                                   :class => 'DMP-Alert'
  div              :type_of_alert,                                    :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/div/div[2]/div[2]/div[1]/div/div/div[1]/div/label/input"
  text_field       :set_from_date_alerts,                             :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/div/div[2]/div[1]/div[2]/div/div/div/input"
  text_field       :set_to_date_alerts,                               :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/div/div[2]/div[1]/div[3]/div/div/div/input"

  #driver_behaviors
  span              :driver_behaviors,                                 :class => 'DMP-Behaviors'
  text_field        :set_from_date_behaviors,                          :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/div/div[2]/div[2]/div[1]/div/div/div/input"
  text_field        :set_to_date_behaviors,                            :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/div/div[2]/div[2]/div[2]/div/div/div/input"


  def select_all_drivers
    select_drivers_elements[0].click
   # select_drivers_elements.each do |element|
   #   element.click
    #end
  end

  def select_type_of_alert
    type_of_alert_element.click
    #type_of_alert_element.div_elements.each do |element|
    #  debugger
    #  element.click
    #end
  end

  def generate_report_based_on_from_and_to_dates
    set_date_from_element.click
    sleep 2
    select_date_elements.sample.click
    set_date_to_element.click
    select_date_elements.sample.click
    sleep 2
    show_report_element.click
  end

  def select_report_type
    span_elements(:class => 'Select-arrow')[0].click
    sleep 3
    select_options_elements[0].click
    span_elements(:class => 'Select-arrow')[1].click
    select_options_elements[0].click
  end


end