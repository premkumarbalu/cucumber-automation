=begin

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
=end

When(/^I click submit button$/) do
  sleep 2
  @current_page.wait_until(30,"Submit button hasn't displayed in Login page"){on(LoginPage).btn_submit_element.visible?}
  on(LoginPage).btn_submit_element.click
end

Then(/^I should see following error messages:$/) do |table|
  table.rows.each do |txt_element|
    @current_page.text.upcase.include?(txt_element.first.upcase).should be_true, "The #{txt_element.first} message hasn't displayed on login page"
  end
end

When(/^I enter valid username$/) do
  on(LoginPage).txt_login_element.value = 'superadmin'
end

And(/^I select Institution$/) do
  on(LoginPage).select_insti_element.select('PUL')
end

When(/^I enter invalid credentials$/) do
  credentials('rwqerwesdf','testing')
end

When(/^I enter valid credentials$/) do
  credentials('superadmin','testing')
end


Then(/^I should see the error message (Invalid Credentials)$/) do |txt_errormsg|
  @current_page.text.upcase.include?(txt_errormsg.upcase).should be_true, "The #{txt_errormsg} message hasn't displayed on login page"
end

Then(/^I should navigate to search page$/) do
  @current_page.wait_until(30, "Search page hasn't displayed"){on(SearchPage).txt_search_box_element.visible?}
end

def credentials(txt_un, txt_pwd)
  on(LoginPage).txt_login_element.value = txt_un
  on(LoginPage).txt_pwd_element.value = txt_pwd
end

When(/^I click logout$/) do
  @current_page.wait_until(30, "Logout button hasn't displayed"){on(SearchPage).lnk_logout_element.visible?}
  on(SearchPage).lnk_logout_element.click
end

Then(/^I should navigate login page$/) do
  @current_page.wait_until(30, "Login page hasn't displayed"){on(LoginPage).login_cont_element.visible?}
end

Then(/^I should see Recap tweet timeline in login page$/) do
  @current_page.wait_until(30, "Twitter timeline hasn't displayed"){on(LoginPage).frm_tweet_element.visible?}
end

And(/^I click Institutions "([^"]*)" on login page:$/) do |txt_symbols|
  case txt_symbols
    when 'Recap'
    on(LoginPage).logo_recap_element.click
   when 'CUL'
    on(LoginPage).logo_cul_element.click
   when 'NYPL'
    on(LoginPage).logo_nypl_element.click
   when 'PUL'
    on(LoginPage).logo_pul_element.click
  end
end

Then(/^I should navigate to corresponding "([^"]*)"$/) do |txt_institution_webpage|
sleep 5
currenturl =  @current_page.current_url
currenturl.upcase.include?(txt_institution_webpage.upcase).should be_true, "The #{txt_institution_webpage} is incorrect"
end

And(/^I click Recap "([^"]*)" on login page:$/) do |lnk_recap|
  case lnk_recap
    when 'AboutRecap'
      on(LoginPage).lnk_home_element.click

    when 'Facility & Storage'
      on(LoginPage).lnk_facility_element.click

    when 'Operations & Statistics'
      on(LoginPage).lnk_opertations_element.click

    when 'Collections & Services'
      on(LoginPage).lnk_collections_element.click

    when 'Information & Publications'
      on(LoginPage).lnk_information_element.click

  end
    sleep 3
   on(SearchPage).switch_browser_title("lnk_recap") rescue nil
end