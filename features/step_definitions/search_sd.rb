Given(/^I launch the SCSB application$/) do
  visit(SearchPage)
end

When(/^I login with valid credentails$/) do
  #pending # express the regexp above with the code you wish you had
end

Then(/^I should see search page with following elements:$/) do |table|

  table.rows.each do |element|
    case element.first
      when 'search box'
        on(SearchPage).txt_search_box_element.visible?.should be_true, "Search box not displayed on search page"
      when 'Owning instituation checkboxes'
        on(SearchPage).checkbox_ownInstId_element.visible?.should be_true, "Owning Institution checkboxes haven't displayed on search page"
      when 'Colloction group checkboxs'
        on(SearchPage).checkbox_cgdId_element.visible?.should be_true, "Colloction group checkboxs haven't displayed on search page"
      when 'Avaliability checkbox'
        on(SearchPage).checkbox_availabilityId_element.visible?.should be_true, "Avaliability checkboxes haven't displayed on search page"
      when 'material type checkboxs'
        on(SearchPage).checkbox_materialTypeId_element.visible?.should be_true, "material type checkboxs haven't displayed on search page"
      when 'All fields dropdown'
        on(SearchPage).drdown_fieldName_element.visible?.should be_true, "All field hasn't displayed on search page"
      when 'Search button'
        on(SearchPage).btn_search_element.visible?.should be_true, "Search button hasn't displayed on search page"
      when 'Use Restriction'
        on(SearchPage).btn_use_restriction_element.visible?.should be_true, "Clear button hasn't displayed on search page"
      when 'New Search button'
        on(SearchPage).btn_newSearch_element.visible?.should be_true, "New Search button hasn't displayed on search page"
    end
  end
end

When(/^I login with valid credential$/) do
  #pending # express the regexp above with the code you wish you had
end

Then(/^I should see the following checkbox filters are checked by defaultly:$/) do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end


When(/^I select All fields drop down$/) do
  on(SearchPage).drdown_fieldName_element.click
end

Then(/^I could see the following elements in all fields dropdown box:$/) do |table|
  table.rows.each do |element|
    txt_value = @current_page.text.upcase.include? (element.first.upcase)
    txt_value.should be_true, " #{element.first} text hasn't displayed in search page"
  end
end

When(/^I enter "(.*?)" in search box$/) do |txt_value|
  on(SearchPage).txt_search_box_element.value = txt_value
end

When(/^I select "(.*?)" in All fields dropdown box$/) do |field_value|
  on(SearchPage).drdown_fieldName_element.select (field_value)
end

When(/^I click search button$/) do
  on(SearchPage).btn_search_element.click
end

Then(/^I should see the search results$/) do
  on(SearchPage).table_searchResultsDiv_element.visible?.should be_true, "Search Result hasn't displayed on search page"
end

Then(/^I should see the following buttons:$/) do |table|
  table.rows.each do |element|
    case element.first
      when 'Request Selected Records'
        on(SearchPage).btn_request_element.visible?.should be_true, "Request button is not visible in search result page"
      when'Export Selected Records '
        on(SearchPage).btn_export_element.visible?.should be_true, "Export button is not visible in search result page"
    end

  end
end

When(/^I click clear button$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I Should see content cleared in the search text field$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see all checkboxe filters are cheked by default$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I click "(.*?)" button$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I Should see default search page$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I search with valid keyword in search box$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I Should see search results in application$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I select "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should navigate new tab with create request with the barcode auto populated is open$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^The selected records are exported as a CSV file in the same format as the grid$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I search with invalid keyword in search box$/) do
  on(SearchPage).txt_search_box_element.value = "ewrrwerwe"
  on(SearchPage).btn_search_element.click
end

Then(/^I should see error message as "(.*?)"$/) do |txt_invalid_msg|
  txt_value = on(SearchPage).txt_searchResultsMsg_element.span_element.text
  txt_invalid_msg.upcase.eql?(txt_value.upcase).should be_true, "Search result message hasn't displayed"
end

When(/^I select tital of bib record randomly$/) do
  on(SearchPage).lnk_title_of_bib_element.click
end

Then(/^I should navigate bib record detail page$/) do
  sleep 5
  on(SearchPage).tbl_bib_detail_page_element.visible?.should be_false, "Bib detail page hasn't displayed"
end

Then(/^I should see cocunt of the bib records$/) do
  @value =  on(SearchPage).txt_total_value_element.text
  @value = @value.gsub(",","")
end

When(/^I select each institution records count$/) do
  on(SearchPage).chck_NYPL_element.click
  on(SearchPage).chck_CUL_element.click
  on(SearchPage).chck_PUL_element.click

  sleep 3
  on(SearchPage).chck_NYPL_element.click
  on(SearchPage).btn_search_element.click
  value_1 =  on(SearchPage).txt_total_value_element.text
  value_1 = value_1.gsub(",","")

  on(SearchPage).chck_NYPL_element.click
  on(SearchPage).chck_CUL_element.click
  on(SearchPage).btn_search_element.click
  value_2 =  on(SearchPage).txt_total_value_element.text
  value_2 = value_2.gsub(",","")


  on(SearchPage).chck_CUL_element.click
  on(SearchPage).chck_PUL_element.click
  on(SearchPage).btn_search_element.click
  value_3 =  on(SearchPage).txt_total_value_element.text
  value_3 = value_3.gsub(",","")

  @values = value_1.to_i + value_2.to_i + value_3.to_i

end


Then(/^I should match with total count of bib records$/) do
  @value.to_i.eql?(@values).should be_true, "Bib total records count is mismatch"
end
#TO uncheck the select/unselect all button and view approx error msg
When(/^I uncheck the Select or Unselect All Facets Option$/) do
  on(SearchPage).chck_selectAllFacets_element.click
end

Then(/^I should see appropriate error message$/) do
  on(SearchPage).txt_alert_alert_info_element.visible?.should be_true, "At least one Search Facet Box needs to be checked to get results"
end


#When select/unselectAll button is checked ,check whether search results are appeared or not
When(/^When the Select or Unselect All Facets Option is Checked$/) do
  on(SearchPage)
end

Then(/^I should be able to see search results$/) do
  on(SearchPage).table_searchResultsDiv_element.visible?.should be_true, "No records are loaded"
end


#To verify reset with New Search button
When(/^I click the New Search button$/) do
  on(SearchPage).btn_newSearch_element.click
end

Then(/^I should be able to see Reset Search Page$/) do
  on(SearchPage).txt_search_box_element.visible?.should be_true, "Search box not displayed on search page"
  on(SearchPage).txt_search_box_element.value = " "
  on(SearchPage).chck_owningInstitutionNYPL_element.enabled?
  on(SearchPage).chck_owningInstitutionPUL_element.enabled?
  on(SearchPage).chck_owningInstitutionCUL_element.enabled?
  on(SearchPage).chck_shared_element.enabled?
  on(SearchPage).chck_private_element.enabled?
  on(SearchPage).chck_open_element.enabled?
  on(SearchPage).chck_available_element.enabled?
  on(SearchPage).chck_notAvailable_element.enabled?
  on(SearchPage).chck_noRestriction_element.enabled?
  on(SearchPage).chck_inLibraryUse_element.enabled?
  on(SearchPage).chck_supervisedUse_element.enabled?
  on(SearchPage).chck_monograph_element.enabled?
  on(SearchPage).chck_serials_element.enabled?
  on(SearchPage).chck_others_element.enabled?
  on(SearchPage).table_searchResultsDiv_element.visible?.should be_false,"Search Results Displayed"
end


#-------automation5

When(/^I uncheck Recap In and Out Check boxes$/) do
  on(SearchPage).chck_available_element.click
  on(SearchPage).chck_notAvailable_element.click

end

  Then(/^I should see there is no search results on the page$/) do
  #on(SearchPage).txt_searchResultsMsg_element.visible?.should be_true,"No Error message Displayed"
  on(SearchPage).table_searchResultsDiv_element.visible?.should be_false,"Search Results Displayed"
end


#------------automation6

When(/^I uncheck nypl, princeton and columbia Check boxes$/) do
  on(SearchPage).chck_owningInstitutionNYPL_element.click
  on(SearchPage).chck_owningInstitutionPUL_element.click
  on(SearchPage).chck_owningInstitutionCUL_element.click
end

Then(/^Search results should be displayed$/) do
  on(SearchPage).table_searchResultsDiv_element.visible?.should be_true,"Search Results Not Displayed"
end


#---------------autoamtion7
# Then(/^I should see the following checkbox filters are checked$/) do
#   on(SearchPage).chck_owningInstitutionNYPL_element.enabled?
#   on(SearchPage).chck_owningInstitutionPUL_element.enabled?
#   on(SearchPage).chck_owningInstitutionCUL_element.enabled?
#   on(SearchPage).chck_shared_element.enabled?
#   on(SearchPage).chck_private_element.enabled?
#   on(SearchPage).chck_open_element.enabled?
#   on(SearchPage).chck_available_element.enabled?
#   on(SearchPage).chck_notAvailable_element.enabled?
#   on(SearchPage).chck_noRestriction_element.enabled?
#   on(SearchPage).chck_inLibraryUse_element.enabled?
#   on(SearchPage).chck_supervisedUse_element.enabled?
#   on(SearchPage).chck_monograph_element.enabled?
#   on(SearchPage).chck_serials_element.enabled?
#   on(SearchPage).chck_others_element.enabled?
# end


Then(/^I should see the following checkbox are checked$/) do |table|
  table.rows.each do |element|
    case element.first
      when 'Avaliability checkbox  '
        on(SearchPage).checkbox_availabilityId_element.exists?
      when 'Owning instituation checkboxes'
        on(SearchPage).checkbox_ownInstId_element.exists?
      when 'Colloction group checkboxs'
        on(SearchPage).checkbox_cgdId_element.exists?
      when 'material type checkboxs  '
        on(SearchPage).checkbox_materialTypeId_element.exists?
    end
  end
end



When(/^I click on Next Button$/) do
  sleep 5
  on(SearchPage).btn_nextbutton_element.click
end


When(/^I select option "(.*?)" in show checkbox$/) do |option_Value|
  on(SearchPage).chck_numOfRecordsId_element.select(option_Value)
end

Then(/^I should see the 25 search results$/) do
  on(SearchPage).tbl_searchResultsDataPlus24_element.visible?.should be_true,"25 search results not there in application"
end


Then(/^I should see the 50 search results$/) do
  on(SearchPage).tbl_searchResultsDataPlus49_element.visible?.should be_true,"50 search results not there in application"
end


Then(/^I should see the 100 search results$/) do
  on(SearchPage).tbl_searchResultsDataPlus99_element.visible?.should be_true,"100 search results not there in application"
end


When(/^I click on showItemsIcon$/) do
  on(SearchPage).image_showItemsIcon_element.click
end

Then(/^I should see the search result of that showItemsIcon$/) do
  on(SearchPage).tbl_searchItemResultsRow5_element.visible?.should be_true,"no header displyed for show item icon"
end

When(/^I uncheck the InRecap CheckBox$/) do
  on(SearchPage).chck_notAvailable_element.click
end


When(/^I click on hideFacetsIcon$/) do
  on(SearchPage).image_showFacetsIcon_element.click
end

Then(/^Bib and Item Facets should not display$/) do
  on(SearchPage).chck_selectAllFacets_element.visible?.should be_false,""
  on(SearchPage).chck_owningInstitutionNYPL_element.visible?.should be_false,""
  on(SearchPage).chck_owningInstitutionPUL_element.visible?.should be_false,""
  on(SearchPage).chck_owningInstitutionCUL_element.visible?.should be_false,""
  on(SearchPage).chck_shared_element.visible?.should be_false,""
  on(SearchPage).chck_private_element.visible?.should be_false,""
  on(SearchPage).chck_open_element.visible?.should be_false,""
  on(SearchPage).chck_available_element.visible?.should be_false,""
  on(SearchPage).chck_notAvailable_element.visible?.should be_false,""
  on(SearchPage).chck_noRestriction_element.visible?.should be_false,""
  on(SearchPage).chck_inLibraryUse_element.visible?.should be_false,""
  on(SearchPage).chck_supervisedUse_element.visible?.should be_false,""
  on(SearchPage).chck_monograph_element.visible?.should be_false,""
  on(SearchPage).chck_serials_element.visible?.should be_false,""
  on(SearchPage).chck_others_element.visible?.should be_false,""
end


When(/^I click on showFacetsIcon$/) do
  on(SearchPage).image_showFacetsIcon_element.click
  on(SearchPage).image_showFacetsIcon_element.click
end

Then(/^Bib and Item Facets should be enabled and display$/) do
  on(SearchPage).chck_selectAllFacets_element.enabled?
  on(SearchPage).chck_owningInstitutionNYPL_element.enabled?
  on(SearchPage).chck_owningInstitutionPUL_element.enabled?
  on(SearchPage).chck_owningInstitutionCUL_element.enabled?
  on(SearchPage).chck_shared_element.enabled?
  on(SearchPage).chck_private_element.enabled?
  on(SearchPage).chck_open_element.enabled?
  on(SearchPage).chck_available_element.enabled?
  on(SearchPage).chck_notAvailable_element.enabled?
  on(SearchPage).chck_noRestriction_element.enabled?
  on(SearchPage).chck_inLibraryUse_element.enabled?
  on(SearchPage).chck_supervisedUse_element.enabled?
  on(SearchPage).chck_monograph_element.enabled?
  on(SearchPage).chck_serials_element.enabled?
  on(SearchPage).chck_others_element.enabled?
  on(SearchPage).chck_selectAllFacets_element.visible?.should be_true,""
  on(SearchPage).chck_owningInstitutionNYPL_element.visible?.should be_true,""
  on(SearchPage).chck_owningInstitutionPUL_element.visible?.should be_true,""
  on(SearchPage).chck_owningInstitutionCUL_element.visible?.should be_true,""
  on(SearchPage).chck_shared_element.visible?.should be_true,""
  on(SearchPage).chck_private_element.visible?.should be_true,""
  on(SearchPage).chck_open_element.visible?.should be_true,""
  on(SearchPage).chck_available_element.visible?.should be_true,""
  on(SearchPage).chck_notAvailable_element.visible?.should be_true,""
  on(SearchPage).chck_noRestriction_element.visible?.should be_true,""
  on(SearchPage).chck_inLibraryUse_element.visible?.should be_true,""
  on(SearchPage).chck_supervisedUse_element.visible?.should be_true,""
  on(SearchPage).chck_monograph_element.visible?.should be_true,""
  on(SearchPage).chck_serials_element.visible?.should be_true,""
  on(SearchPage).chck_others_element.visible?.should be_true,""
end


When(/^I uncheck all bib facets$/) do
  on(SearchPage).chck_owningInstitutionNYPL_element.click
  on(SearchPage).chck_owningInstitutionPUL_element.click
  on(SearchPage).chck_owningInstitutionCUL_element.click
  on(SearchPage).chck_monograph_element.click
  on(SearchPage).chck_serials_element.click
  on(SearchPage).chck_others_element.click
end

Then(/^I should see the error message as "(.*?)"$/) do |errormessage|
  errortext = on(SearchPage).txt_alert_alert_info_element.span_element.text
  errormessage.upcase.eql?(errortext.upcase).should be_true, "At least one Bib Facet Box and one Item Facet Box needs to be checked to get results hasn't displayed"
end


When(/^I uncheck all Item facets$/) do
  on(SearchPage).chck_shared_element.click
  on(SearchPage).chck_private_element.click
  on(SearchPage).chck_open_element.click
  on(SearchPage).chck_available_element.click
  on(SearchPage).chck_notAvailable_element.click
  on(SearchPage).chck_noRestriction_element.click
  on(SearchPage).chck_inLibraryUse_element.click
  on(SearchPage).chck_supervisedUse_element.click
end

When(/^I click on clear button$/) do
  on(SearchPage).image_clearSearchText_element.click
end

Then(/^search text in the search box should be cleared$/) do
  on(SearchPage).txt_search_box_element.value = ""
end


