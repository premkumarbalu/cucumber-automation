Given(/^I select Collection tab on the page$/) do
  @barcode = on(SearchPage).get_valid_barcode
  on(SearchPage).tab_collection_element.click
end

Then(/^I should see collection page with following elements:$/) do |table|

   table.rows.each do |elements|
     case elements.first
       when "search box"
          on(CollectionPage).txt_search_box_element.visible?.should be_true, "Search box hasn't displayed on collection page"
       when "Display records button"
         on(CollectionPage).btn_displayrecords_element.visible?.should be_true, "Display Button hasn't displayed on collection page"
       when "Note text"
         on(CollectionPage).txt_note_element.visible?.should be_true, "Note text hasn't displayed on collection page"
     end
   end
end

Then(/^I should see collection UI page$/) do
  on(CollectionPage).txt_search_box_element.visible?.should be_true, "Search box hasn't displayed on collection page"
end

When(/^I enter valid Barcode in collection search box$/) do
  on(CollectionPage).txt_search_box_element.value = @barcode
end

And(/^I click Display Records$/)do
on(CollectionPage).btn_displayrecords_element.click
end

Then(/^I should see search results in collection UI page$/) do
  on(CollectionPage).btn_displayrecords_element.click
  @current_page.wait_until(30,"Collection results haven't displayed"){on(CollectionPage).txt_collectionresults_element.visible?}
  on(CollectionPage).txt_collectionresults_element.visible?.should be_true,"Collection results haven't displayed"
end

When(/^I enter invalid (1234566789) barcode in collection search box$/) do |txt_barcode|
  @invalid_barcode = txt_barcode
  on(CollectionPage).txt_search_box_element.value = txt_barcode
end

Then(/^I should see message "(.*?)"$/) do |txt_msg|
  @current_page.text.include?(txt_msg+" - "+ on(CollectionPage).txt_search_box_element.value).should be_true, "BarCode not found message hasn't displayed"
end

Then(/^I should see search results with following elements:$/) do |table|

  table.rows.each do |elements|
    case elements.first
      when 'Barcode'
        on(CollectionPage).txt_barcode?.should be_true, "Barcode text hasn't displayed"
      when 'Title'
        on(CollectionPage).txt_title?.should be_true, "Title text hasn't displayed"
      when 'CGD'
        on(CollectionPage).txt_cgd?.should be_true, "CGD text hasn't displayed"
    end
  end
end

When(/^I click on the title$/) do
  sleep 5
  on(CollectionPage).lnk_title_element.click

  #on(SearchPage).switch_browser_title('Collection Update')
  @current_page.wait_until(30,"Item detail page hasn't displayed"){on(CollectionPage).txt_item_details_element.visible?}
end

Then(/^I should see item detail page with following elements$/) do |table|

  table.rows.each do |elements|
    case elements.first
      when 'item details'
        on(CollectionPage).txt_item_details_element.visible?.should be_true, "Item detail page hasn't displayed"
      when 'Edit CGD radio Button'
        on(CollectionPage).btn_editcgdaction_element.visible?.should be_true, "Edit CGD button hasn't displayed"
      when 'Deaccession radio button'
        on(CollectionPage).btn_deaccesionaction?.should be_true, "Deaccession radio button hasn't displayed"
      when 'New CGD'
        on(CollectionPage).sel_newcgdfield_element.visible?.should be_true, "New CGD drop down hasn't displayed"
      when 'CGD Change Notes'
        on(CollectionPage).txt_cgdchangenotesfield_element.visible?.should be_true, "CGD notes field hasn't displayed"
      when 'Deaccession Type'
        @current_page.wait_until(30, "Deaccession type drop down hasn't displayed" ){on(CollectionPage).txt_deaccessiontype_element.visible?}
        on(CollectionPage).txt_deaccessiontype_element.visible?.should be_true, "Deaccession type drop down hasn't displayed"
      when 'Delivery Location'
        on(CollectionPage).txt_deliverylocation_element.visible?.should be_true, "delivery location drop down hasn't displayed"
      when 'Deaccession Notes'
        on(CollectionPage).txt_deaccessionnotesfield_element.visible?.should be_true, "Deaccession note field hasn't displayed"
      when 'Submit button'
       begin
        on(CollectionPage).btn_cgd_collectionupdatebutton_element.visible?.should be_true, "Submit button hasn't displayed"
       rescue
         on(CollectionPage).btn_deaccession_collectionupdatebutton_element.visible?.should be_true, "Submit button hasn't displayed"
       end
    end
  end
end

Then(/^I should see item detail page$/) do
  on(CollectionPage).txt_item_details_element.visible?.should be_true, "Item detail page hasn't displayed"
end

When(/^I select edit CGD radio button$/) do
  on(CollectionPage).btn_editcgdaction_element.click
end

 And(/^I select New CGD$/) do
  @txt_cgd = on(CollectionPage).sel_newcgdfield_element.value
  case @txt_cgd
    when 'Shared'
      on(CollectionPage).sel_newcgdfield_element.select('Open')
      @new_cgd = 'Open'
    when 'Private'
      on(CollectionPage).sel_newcgdfield_element.select('Shared')
      @new_cgd = 'Shared'
    when 'Open'
      on(CollectionPage).sel_newcgdfield_element.select('Private')
      @new_cgd = 'Private'
  end
 end

When(/^I select new CGD$/) do
  @txt_cgd = on(CollectionPage).sel_newcgdfield_element.value
  case @txt_cgd
    when 'Shared'
      on(CollectionPage).sel_newcgdfield_element.select('Open')
      @new_cgd = 'Open'
    when 'Private'
      on(CollectionPage).sel_newcgdfield_element.select('Shared')
      @new_cgd = 'Shared'
    when 'Open'
      on(CollectionPage).sel_newcgdfield_element.select('Private')
      @new_cgd = 'Private'
  end
end


And(/^I enter CGD change notes$/) do
  on(CollectionPage).txt_cgdchangenotesfield_element.value = 'Testing - Changed new CGD'
end

And(/^I click submit$/) do

  on(CollectionPage).btn_cgd_collectionupdatebutton_element.click rescue on(CollectionPage).btn_deaccession_collectionupdatebutton_element.click
end

Then(/^I should see (The CGD has been successfully updated)$/) do |txt_msg|
  sleep 10
  @current_page.text.upcase.include?(txt_msg.upcase).should be_true, "Success message hasn't displayed"
end

And(/^I navigate to collection UI page$/) do
  step 'I select Collection tab on the page'
end

When(/^I navigate to item detail page$/) do
  step 'I enter valid Barcode in collection search box'
  step 'I should see search results in collection UI page'
  step 'I click on the title'
  step 'I should see item detail page'
end

Then(/^I should see error message "(.*?)"$/) do |txt_err_msg|
  @current_page.text.upcase.include?(txt_err_msg.upcase).should be_true, "CGD Note error message hasn't displayed"
end

Then(/^I should see message (Please enter CGD Change Notes)$/) do |txt_err_msg|
  if @txt_cgd == 'Shared'
    @current_page.text.upcase.include?(txt_err_msg.upcase).should be_true, "CGD Note error message hasn't displayed"
  end
end

And(/^I select deaccession radio button$/) do
  on(CollectionPage).btn_deaccesionaction_element.click
end

And(/^I select delivery location$/) do
  sleep 3
  delivery_locations =  on(CollectionPage).txt_deliverylocation_element.text.gsub("\n",",").split(",")
  sleep 3
  on(CollectionPage).txt_deliverylocation_element.select(delivery_locations.sample)
end

And(/^I enter deaccession notes$/) do
  sleep 3
  on(CollectionPage).txt_deaccessionnotesfield_element.value = "Deaccession-Testing"
end

Then(/^I should see (The item has been successfully deaccessioned)$/) do |txt_msg|
  @current_page.wait_until(30,"Deaccession success message hasn't displayed"){@current_page.div_element(:class=>'bg-success').visible?}
  @current_page.text.upcase.include?(txt_msg.upcase).should be_true, "Deaccession success message hasn't displayed"
end

Then(/^I should see list of delivery location based on the customer code$/) do
  delivery_locations =  on(CollectionPage).txt_deliverylocation_element.text.gsub("\n",",").split(",")
  delivery_locations.nil?.should be_false, "Delivery location hasn't displayed"
end

When(/^I serach with the same barcode in collection UI$/) do
  #on(SearchPage).switch_browser_title('Search Records')
  on(CollectionPage).btn_close_element.click
  sleep 2
  step 'I enter valid Barcode in collection search box'
  step 'I click Display Records'
end

When(/^I search with same barcode in collection UI$/) do
  #on(SearchPage).switch_browser_title('Search Records')
  on(CollectionPage).btn_close_element.click
  sleep 2
  step 'I enter valid Barcode in collection search box'
  step 'I click Display Records'
end

Then(/^I should see updated CGD in the table view$/) do
on(CollectionPage).CGD_status_element.text.upcase.eql?(@new_cgd.upcase).should be_true, "New CGD hasn't updated in collection UI page"
end
