
And(/^I should see the following details in all drivers page:$/) do |table|
  table.rows.each do |text|
    message = "#{text} hasn't displayed in all drivers page"
    case text.first
      when 'google-map'
        on(DriverListPage).google_map_element.visible?.should be_true, message
      when 'driver_marker'
        on(DriverListPage).driver_marker_element.visible?.should be_true, message
      when 'filter_drop_down'
        on(DriverListPage).filter_element.visible?.should be_true, message
      when 'auto_update_button'
        on(DriverListPage).btn_auto_update_element.visible?.should be_true, message
      when 'search_filter'
        on(DriverListPage).search_option_element.visible?.should be_true, message
      when 'driver_image'
        on(DriverListPage).img_driver_image_element.visible?.should be_true, message
      when 'driver_name'
        on(DriverListPage).txt_driver_name_element.visible?.should be_true, message
      when 'vehicle_name'
        on(DriverListPage).txt_vehicle_name_element.visible?.should be_true, message
      when 'driver_address'
        on(DriverListPage).txt_driver_address_element.visible?.should be_true, message
      when 'driver_status'
        on(DriverListPage).txt_driver_status_element.visible?.should be_true, message
      when 'driver_tags'
        # not Mandatory
        on(DriverListPage).txt_driver_group_tag_element.visible?.should be_true, message rescue nil
      when 'report'
        on(DriverListPage).lnk_report_element.visible?.should be_true, message
      when 'settings'
        on(DriverListPage).lnk_settings_element.visible?.should be_true, message
      when 'logout'
        on(DriverListPage).lnk_logout_element.visible?.should be_true, message
    end
  end
end

When(/^I search (Karthik) driver detail in search filter$/) do |text|
  @search_text = text
  on(DriverListPage).search_option_element.value = text
end

Then(/^I should see search results on the page$/) do
  on(DriverListPage).txt_driver_count_element.visible?.should  be_true, "Zero result found result hasn't displayed"
  #debugger
  #search_result_driver_name = on(DriverListPage).txt_driver_name_element.text
  #begin
  #   search_result_driver_name.upcase.include?(@search_text.upcase).should be_true, "search results are incorrect"
  #rescue
  #  on(DriverListPage).txt_driver_count_element.visible?.should  be_true, "Zero result found result hasn't displayed"
  #end
end

When(/^I select filter option randomly$/) do
  on(DriverListPage).filter_element.click
  on(DriverListPage).radio_btn_filter_elements.sample.click
end

Then(/^I should see filter results on the page$/)do
  on(DriverListPage).list_of_drivers_element.visible?.should be_true, "All drivers page hasn't displayed"
end

And(/^I select random driver in all drivers page$/) do
  on(DriverListPage).lnk_list_of_drivers_elements.sample.click
  #on(DriverListPage).lnk_list_of_drivers_elements[0].click
end

Then(/^I should see driver detail page$/) do
  @current_page.wait_until(30, "Driver detail page hasn't displayed"){on(DpDriverDetail).driver_details_icon_element.visible?}
  on(DpDriverDetail).driver_details_icon_element.visible?.should be_true, "Driver detail page hasn't displayed"
end

Then(/^I should see the count of drivers on the page$/) do
  get_driver_list_count = on(DriverListPage).driver_list_count_element.div_elements(:class => 'driver').count
  get_driver_count = on(DriverListPage).txt_driver_count_element.text
  get_driver_list_count.to_i.eql?(get_driver_count.to_i).should be_true, "Driver count is mismatch with drivers list"
end