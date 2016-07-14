class DpTripPage

  include PageObject

   #DriverPortal
    div            :trip_detail,                            :class => 'trip_detail'
    divs           :txt_trip,                               :class => 'trip'
    divs           :txt_trip_time,                          :class => 'trip-time'
    div            :driver_score,                           :class => 'photo-grade'
    spans          :trip_tag,                               :class => 'tag'
    divs           :tag_items,                              :class => 'tag-item'
    divs           :txt_max_speed,                          :class => 'max-speed'
    checkboxes       :check_box_day_toggle,                   :class => 'day-toggle'

    #A trip details
    div            :txt_mileage,                           :class => 'mileage'
    div            :txt_event,                             :class => 'event'
    div            :txt_max_speed,                         :class => 'max-speed'
    div            :txt_avg_speed,                         :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div[2]/div/div[6]/div[2]"
    div            :txt_fuel,                              :class => 'fuel-used'
    div            :txt_score,                             :class => 'photo-grade'


  def get_total_count_of_trip
    debugger
    statistics_total_trip_count = txt_trip_elements.count
    if statistics_total_trip_count.to_i > 14
      statistics_total_trip_count= 14
    end
    return statistics_total_trip_count
  end

  def get_statistics_of_time
    max_count = 1
    txt_time_and_distance_elements.each do |element|
      if max_count <=14
         if element.text.include?('mins')
            driver_time = element.span_element.text.strftime("%H:%M:%S")
            driver_time += driver_time
         end
         max_count += 1
      end
    end
   return driver_time
  end

  def update_tag
    sleep 2
    tag_items_elements.each do |element|
       until element.visible? == false
             element.click
       end
    end
  end
end