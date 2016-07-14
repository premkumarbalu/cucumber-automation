class ScorePage

  include PageObject

   #DriverPortal
   #Your Score
    div                 :score_statistics,                          :class => 'score-statistics'
    div                 :grade_info,                                :class => 'grade-info'
    div                 :txt_start_date,                            :class => 'stats-item'
    div                 :your_score_status,                         :class => 'stats'

    #score_breakdown
    div                 :score_status,                              :class => 'score-breakdown'
    div                 :score_chart,                               :class => 'breakdown-chart'
    div                 :score_grade,                               :class => 'breakdown'
    span                :breakdown,                                 :class => 'DMP-Breakdown'

    #usage-statistics
    div                 :usage_statistics,                          :class => 'usage-statistics'
    div                 :time_summary,                              :class => 'summary'
    div                 :road_settings,                             :class => 'road-settings'
    div                 :road_type,                                 :class => 'road-types'
    div                 :time_of_day,                               :class => 'time-of_day'
    span                :time_and_road_usage,                       :class => 'DMP-Time-Road-Usage'

   #behaviors
    div                 :txt_behaviors,                             :class => 'behaviors'
    div                 :txt_behaviors_table,                       :class => 'behaviors-table'
    div                 :index,                                     :class => 'legend'
    div                 :txt_behaviors,                             :class => 'DMP-Behaviors'

  #Driver_alert
    divs                  :alert_count,                              :class => 'event-count'
    divs                  :left_arrow,                               :class => 'arrow-left'
    divs                  :alert_time,                               :class => 'event-time'
    buttons               :show_trip,                                :class => 'btn-default'
    text_field            :start_date,                               :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[1]/div[3]/div[1]/div[2]/div[1]/div/input"
    text_field            :end_date,                                 :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[1]/div[3]/div[1]/div[2]/div[2]/div/input"
    div                   :all_alert_event,                          :class => 'all-event-count'
    divs                  :select_date,                              :class => 'datepicker__day'
    div                   :no_result,                                :class => 'no-results'



  def get_alert_count_of_under_each_alert_icon
   alert_count_elements.each do |element|
       alert_count = element.text
       alert_count.empty?.should be_false, "Alert count haven't displayed"
   end
  end

  def select_left_arrow_of_all_the_alert
   left_arrow_elements.each do |element|
    element.click
   end
  end

  def verify_alert_timings
   alert_time_elements.each do |element|
    alert_time = element.text
    alert_time.empty?.should be_false, "Alert time hasn't displayed"
   end
  end

end