class VehicleHealthPage

  include PageObject

   #DriverPortal
    div            :txt_vehicle_overview,                            :class => 'vehicle-overview'
    div            :txt_vehicle_info,                                :class => 'vehicle-info'
    div            :txt_vehicle_details,                             :class => 'vehicle-details'
    div            :txt_vehicle_maintenances,                        :class => 'maintenances'

    div            :txt_past_service,                                 :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div[2]/div[2]/div[2]/div[1]/div[1]/span"
    div            :txt_next_service,                                 :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div[2]/div[2]/div[2]/div[1]/div[2]/span"
    div            :txt_future_service,                               :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div[2]/div[2]/div[2]/div[1]/div[3]/span"
    link           :lnk_create_your_own_maintenance,                  :class => 'pull-right'
    text_field     :txt_maintance_title,                              :id => 'action'
    text_field     :txt_miles,                                        :id => 'interval_mileage'
    divs           :txt_driver_select,                                :class => 'driver-select'
    button         :btn_create,                                       :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div[2]/div[1]/div[2]/div/div/div/div[3]/div[5]/div/button"

  #Driver Limit Settings
   divs           :txt_limit_on_off,                                   :class => 'toggle-details'

  def create_your_own_maintenance
   lnk_create_your_own_maintenance_element.click
   sleep 3
   txt_maintance_title_element.value = 'Testing'
   txt_miles_element.value = '10000'
   txt_driver_select_elements.sample.div_element(:class => "col-md-1").checkbox_element.click
   btn_create_element.click
  end

  def turn_on_each_limit
   txt_limit_on_off_elements.each do |element|
     if element.span_element(:class => 'toggle-text').text == 'OFF'
        element.span_element(:class => 'toggle-circle').click
     end
   end

  end


end