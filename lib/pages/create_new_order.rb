class NewOrder
include PageObject


    link             :lnk_add_new_order,              :xpath => ".//*[@id='main-navbar-collapse']/div/ul/li[1]/a"
    #Customer Detail
    text_field       :txt_email_id,                   :id => 'new-order-policy'
    text_field       :txt_first_name,                 :id => 'order_customer_attributes_first_name'
    text_field       :txt_last_name,                  :id => 'order_customer_attributes_last_name'
    text_field       :txt_phone,                      :id => 'order_customer_attributes_phone'

   #Customer Address info
    text_field       :txt_street,                     :id => 'order_customer_attributes_address_attributes_street'
    text_field       :txt_suite,                      :id => 'order_customer_attributes_address_attributes_suite'
    text_field       :txt_city,                       :id => 'order_customer_attributes_address_attributes_city'
    text_field       :txt_state,                      :id => 'order_customer_attributes_address_attributes_state'
    text_field       :txt_zip_code,                   :id => 'order_customer_attributes_address_attributes_zip_code'

   #Vehicles Information
    text_field       :txt_make,                       :id => 'order_order_items_attributes_0_make'
    text_field       :txt_model,                      :id => 'order_order_items_attributes_0_model'
    text_field       :txt_year,                       :id => 'order_order_items_attributes_0_year'
    text_field       :txt_driver_name,                :id => 'order_order_items_attributes_0_name'
    text_field       :txt_driver_email,               :id => 'order_order_items_attributes_0_driver_email'
    select_list      :txt_device_kind,                :id => 'order_order_items_attributes_0_device_kind'
    text_field       :txt_meid,                       :id => 'order_order_items_attributes_0_meid'

    button           :btn_save_order,                 :name => 'button'

    div              :txt_alert_success,              :class => 'alert-success'
    divs             :lnk_login,                      :class => 'login'


def create_new_order
      new_order = TestData.create_order
      populate_page_with new_order
    end


end