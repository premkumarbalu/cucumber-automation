
And(/^I navigate to request page$/) do
on(SearchPage).tab_request_element.click
end

And(/^I click create button$/) do
  on(RequestPage).create_button_element.click
end

Then(/^I should see mandatory fields error messages:$/) do |table|
 table.rows.each do |text_ele|
   @current_page.text.upcase.include?(text_ele.first.upcase).should be_true, "The #{text_ele.first}error message hasn't displayed "
 end

end

And(/^I enter (own|cross) institution (PUL|CUL|NYPL) to (PUL|CUL|NYPL) mandaory information in request page$/) do |txt_own, txt_insti, txt_crossInsti|
  @availbale_barcode = get_available_barcode(txt_insti)
  on(SearchPage).tab_request_element.click
  on(RequestPage).txt_itembarcode_element.value = @availbale_barcode
  on(RequestPage).sele_requestinginsti_element.select(txt_crossInsti)
  on(RequestPage).populate_data(txt_insti)
end

And(/^I click create$/) do
  on(RequestPage).create_button_element.click
  @current_page.wait_until(30, "Create another window hasn't displayed"){on(RequestPage).create_another_request_element.visible?}
  on(RequestPage).create_another_request_element.click
end

Then(/^I should see request details in request page$/) do
  sleep 3
  on(RequestPage).lnk_searchrequest_element.click
  sleep 2
  on(RequestPage).itembarcode_element.value = @availbale_barcode
  on(RequestPage).btn_search_element.click
  sleep 30
  @current_page.text.include?(@availbale_barcode).should be_true, "Request hasn't created for barcode #{@availbale_barcode}"
end



def get_available_barcode(txt_institution)
  on(SearchPage).tab_search_element.click
  sleep 2
  case txt_institution
    when 'PUL'
      on(SearchPage).btn_show_facts_element.click
      sleep 2
      on(SearchPage).click_facts('NYPL')
      sleep 2
      on(SearchPage).click_facts('Columbia')
      sleep 2
    when 'CUL'
      on(SearchPage).btn_show_facts_element.click
      sleep 2
      on(SearchPage).click_facts('NYPL')
      sleep 2
      on(SearchPage).click_facts('Princeton')
      sleep 2
    when 'NYPL'
      on(SearchPage).btn_show_facts_element.click
      sleep 2
      on(SearchPage).click_facts('Columbia')
      sleep 2
      on(SearchPage).click_facts('Princeton')
      sleep 2
  end
  return on(SearchPage).get_valid_barcode
  on(SearchPage).tab_request_element.click
end

