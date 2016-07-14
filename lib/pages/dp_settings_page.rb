class SettingsPage

  include PageObject

    div             :user_settings,                            :class => 'settings'
    span            :delete_button,                            :class => 'fa-trash'
    button          :confirm_popup_button,                     :class => 'btn-primary'
    span            :successful_msg,                           :xpath => ".//*[@id='root']/div/div/div[2]/div/div[1]/div/div/div[1]/span"

  #Settings Page
    text_field      :user_name,                                :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/div[3]/form/div[1]/div[1]/input"
    text_field      :last_name,                                :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/div[3]/form/div[1]/div[3]/input"
    text_field      :email_id,                                 :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/div[3]/form/div[2]/div[1]/input"
    text_field      :phone_number,                             :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/div[3]/form/div[2]/div[2]/input"
    text_field      :txt_password,                             :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/div[4]/div/form/div[1]/div[1]/input"
    text_field      :txt_password_confi,                       :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/div[4]/div/form/div[1]/div[2]/input"
    button          :update_button1,                           :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/div[3]/form/div[4]/div/div/input"
    button          :update_button2,                           :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/div[4]/div/form/div[2]/div[2]/div/div/input"

  #user_vehicle
  span              :edit_driver_info,                         :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/div[2]/table/tbody/tr[1]/td[7]/a[1]/span"
  text_field        :vehicle_make,                             :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/div[5]/div[2]/form/div[1]/div[1]/div/input"
  text_field        :vehicle_model,                            :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/div[5]/div[2]/form/div[1]/div[2]/div/input"
  text_field        :vehicle_year,                             :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/div[5]/div[2]/form/div[1]/div[3]/div/input"
  text_field        :miles,                                    :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/div[5]/div[2]/form/div[2]/div[1]/input"
  text_field        :battery_threshold,                        :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/div[5]/div[2]/form/div[2]/div[2]/input"
  text_field        :engine_threshold,                         :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/div[5]/div[2]/form/div[2]/div[3]/input"
  select_list       :fuel_type,                                :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/div[5]/div[2]/form/div[3]/div[1]/select"
  text_field        :fuel_tank_size,                           :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/div[5]/div[2]/form/div[3]/div[2]/input"
  text_field        :fuel_economy,                             :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/div[5]/div[2]/form/div[3]/div[3]/input"
  select_list       :exp_month,                                :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/div[5]/div[2]/form/div[4]/div[2]/select"
  select_list       :exp_year,                                 :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/div[5]/div[2]/form/div[4]/div[3]/select"
  button            :vehicle_info_update,                      :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/div[5]/div[2]/form/div[5]/div/div/input"

   #Settings/Group
  span              :lnk_settings_group,                       :class => 'SF-DriversLogins'
  button            :create_new_group,                         :class => 'btn-lg'
  text_field        :group_name,                               :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/form/div[1]/div[1]/input"
  span              :display_group_color,                      :class => 'Select-arrow-zone'
  divs              :select_color,                             :class => 'Select-option'
  checkboxes        :select_driver_name,                       :name => 'driver'
  button            :update_button,                            :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/form/div[3]/div/input"
  table             :vehicle_count,                            :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/div/form/div[2]/table/tbody/tr[1]/td[3]"
  span              :lnk_show,                                 :class => 'SF-Marker'
  span              :edit_group,                               :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/div/form/div[2]/table/tbody/tr[1]/td[4]/a[2]/span"

  #Driving_limits
  span              :driving_limit,                            :class => 'SF-DrivingLimits'
  h4                :driver_max_speed,                         :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/div[2]/div[1]/div/div[2]/h4"
  h4                :driver_time_of_day_limit,                 :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/div[2]/div[2]/div/div[2]/h4"
  h4                :driver_milage_limit,                      :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/div[2]/div[3]/div/div[2]/h4"
  h4                :driver_phone_usage_event_alerts,          :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/div[2]/div[4]/div[1]/div[2]/h4"
  span              :add_new_setup,                            :class => 'fa-plus-square-o'
  span              :select_drivers,                           :class => 'input-element'
  div               :slider,                                   :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/div[2]/div[2]/div[2]/div/div[2]/div[2]/div[2]/div/div[2]"
  button            :btn_update_button,                        :class => 'btn-default'
  span              :edit_icon,                                :class => 'limit-group-action'

  #Trip tags
  span              :trip_tags_icon,                           :class => 'fa-tags'
  link              :add_new_trip_tag,                         :class => 'b-blue'
  button            :update_trip_tag,                          :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/form/div[2]/div/div/input"
  tables            :table_name,                               :class => 'table'
  #Support
  span              :support_icon,                             :class => 'fa-life-ring'
  div               :tnx_message,                              :class =>'message'
  text_field        :subject,                                  :xpath => "//input[@type='text']"
  text_field        :description,                              :css => "textarea.b-highlight.form-control"
  button            :send_button,                              :class => 'b-green'


  def edit_driver_informations
    edit_driver_info_element.click
    user_name_element.value = 'Raj'
    last_name_element.value = 'Testing'
    #email_id_element.value = "driver_email_id_test#{Time.now.to_i/2}@gmail.com"
    phone_number_element.value = '0123456789'
    update_button1_element.click
  end

  def update_vehicle_details
    vehicle_details = TestData.edit_vehicle_informations
    populate_page_with vehicle_details
    vehicle_info_update_element.click
  end

  def create_new_group
    sleep 3
    group_name_element.value = "testing#{Time.now.to_i/2}"
    display_group_color_element.click
    sleep 5
    select_color_elements.sample.div_element.click
    select_driver_name_elements.each do |element|
      element.click
    end
    update_button_element.click
  end


  def create_new_trip_tag
    sleep 3
    group_name_element.value = "testing#{Time.now.to_i/2}"
    sleep 3
    display_group_color_element.click
    sleep 5
    select_color_elements.sample.div_element.click
    update_trip_tag_element.click
  end

  def get_new_trip_row_no
    sleep 2
    trip_tag_name = table_elements(:class=>'table').first.text
    trip_tag_name = trip_tag_name.split("\n")
    i = 0
    trip_tag_name.each do |element|
        if element.include?('testing') == true
          return i
           break
        end
        i += 1
    end
  end

  def edit_update_new_trip
    @row_value = get_new_trip_row_no
    span_element(:xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/div[2]/table/tbody/tr[#{@row_value}]/td[3]/a[1]/span").click
    sleep 2
    create_new_trip_tag
  end

  def delete_created_new_trip
    @row_value = get_new_trip_row_no
    span_element(:xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/div[2]/table/tbody/tr[#{@row_value}]/td[3]/a[2]").click
    sleep 3
    confirm_popup_button_element.click
  end

end

