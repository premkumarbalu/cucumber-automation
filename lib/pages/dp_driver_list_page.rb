class DriverListPage
include PageObject

    div           :list_of_drivers,                 :class => 'driver-listing'
    div           :google_map,                      :class => 'google-map'
    div           :driver_marker,                   :class => 'marker'
    button        :filter,                          :class => 'dropdown-toggle'
    div           :btn_auto_update,                 :class => 'toggle-set-bounds'
    text_field    :search_option,                   :class => 'search_filter'
    div           :img_driver_image,                :class => 'photo'
    div           :txt_driver_name,                 :class => 'driver-name'
    div           :txt_vehicle_name,                :class => 'vehicle-name'
    div           :txt_driver_address,              :class => 'driver-address'
    div           :txt_driver_status,               :class => 'driver-status'
    div           :txt_driver_group_tag,            :class => 'driver-tags'
    link          :lnk_report,                      :class => 'reports'
    link          :lnk_settings,                    :class => 'preference'
    link          :lnk_logout,                      :class => 'logout'
    divs          :radio_btn_filter,                :class => 'filterable-item'
    divs          :lnk_list_of_drivers,             :class => 'driver'
    div           :driver_list_count,               :class => 'driver-listing'
    div           :txt_driver_count,                :class => 'count'

   #Owner detail
    link          :lnk_user_vechile,                :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[1]/div/div/div/a[1]"
    link          :lnk_create_dispatch_user,        :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/div[1]/form/div[2]/div[2]/a"

   #create dispatch
   text_field          :txt_first_name,              :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/form/div[1]/div[1]/input"
   text_field          :txt_last_name,               :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/form/div[1]/div[2]/input"
   text_field          :txt_email,                   :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/form/div[2]/div[1]/input"
   text_field          :txt_pwd,                     :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/form/div[4]/div[1]/input"
   text_field          :txt_pwd_confi,               :xpath => ".//*[@id='root']/div/div/div[2]/div/div[2]/div[2]/div/form/div[4]/div[2]/input"
   button              :btn_create,                      :class => "b-blue"

  ##def initialize_page
    #has_expected_element?
  #end

    def login_driver_portal
      driver_valid_credentials = TestData.driver_portal_login_details
      populate_page_with driver_valid_credentials
      continue_element.click
    end

    def create_a_dispatch_user
      driver_valid_credentials = TestData.create_dispatcher
      populate_page_with driver_valid_credentials
      return driver_valid_credentials['txt_email']
    end

end