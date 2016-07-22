class DpDriverDetail
include PageObject

    span           :driver_details_icon,                   :class => 'SF-Driver'
    span           :view_trips_icon,                       :class => 'SF-Trips'
    span           :driver_score_icon,                     :class => 'SF-Score'
    span           :vehicle_health_icon,                   :class => 'SF-Diagnostics'
    span           :driver_limit_setting_icon,             :class => 'SF-Limits'
    span           :driver_alerts_icon,                    :class => 'SF-Alerts'
    link           :driver_reports,                        :class => 'reports'
    span           :logout_btn,                            :class => 'glyphicon-log-out'

    span            :txt_parked_time,                      :class => 'message'
    div             :img_driver_photo,                     :class => 'photo'
    link            :lnk_all_trips,                        :class => 'b-highlight'
    span            :txt_driver_status,                    :class => 'state'

    div             :txt_driver_name,                       :class => 'driver-name'
    div             :txt_vehicle_name,                      :class => 'vehicle-name'
    div             :txt_driver_status,                     :class => 'driver-status'
    div             :txt_driver_address,                    :class => 'driver-address'
    div             :total_driver_trips,                    :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/div[6]/div[1]/div[1]/div[1]"
    div             :total_hours,                           :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/div[6]/div[1]/div[1]/div[2]"
    div             :total_distance,                        :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/div[6]/div[1]/div[1]/div[3]"
    div             :max_speed,                             :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/div[6]/div[1]/div[1]/div[4]"
    divs            :driver_score,                          :class => 'photo-grade'
  ##def initialize_page
    #has_expected_element?
  #end

  def navigate_with_driver_score_page
      driver_score_elements.each do |element|
           if element.text != '?'
               element.click
               break
           end
      end
  end

end