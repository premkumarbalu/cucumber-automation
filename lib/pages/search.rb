
class SearchPage
  include PageObject

  #page_url ENV['URL']

  #page_url"http://dev-recap.htcinc.com:9090/search"
  #page_url "http://uat-recap.htcinc.com:9090/search"
  page_url "http://tst-recap.htcinc.com:9090/search"
  #Search page

  text_field       :txt_search_box,                                 :id => 'fieldValue'
  div              :checkbox_ownInstId,                             :xpath => "html/body/section/div/div/div/div/div/form/fieldset/div/div/div/div[2]/div[2]/div[2]/div/div[1]"
  div              :checkbox_cgdId,                                 :xpath => "html/body/section/div/div/div/div/div/form/fieldset/div/div/div/div[2]/div[3]/div[2]/div[1]"
  div              :checkbox_availabilityId,                        :xpath => 'html/body/section/div/div/div/div/div/form/fieldset/div/div/div/div[2]/div[3]/div[2]/div[2]'
  div              :checkbox_materialTypeId,                        :xpath => 'html/body/section/div/div/div/div/div/form/fieldset/div/div/div/div[2]/div[2]/div[2]/div/div[2]'
  select_list      :drdown_fieldName,                               :id => 'fieldName'
  button           :btn_search,                                     :id => 'search'
  button           :btn_use_restriction,                            :xpath => 'html/body/section/div/div/div/div/div/form/fieldset/div/div/div/div[2]/div[3]/div[2]/div[3]'
  button           :btn_newSearch,                                  :id => 'newSearch'
  button           :btn_nextbutton,                                 :id => "nextBottom"
  button           :btn_lastBottom,                                 :id => 'lastBottom'
  div              :table_searchResultsDiv,                         :id => 'searchResultsDiv'
  span             :image_showFacetsIcon,                           :id => 'showFacets'
  image            :image_clearSearchText,                          :id => 'clearSearchText'
  link             :tab_collection,                                 :class =>'tab-collection'
  #Searchpage--checkboxes----
  checkbox         :chck_owningInstitutionNYPL,                     :id => 'owningInstitutionNYPL'
  checkbox         :chck_owningInstitutionCUL,                      :id => 'owningInstitutionCUL'
  checkbox         :chck_owningInstitutionPUL,                      :id => 'owningInstitutionPUL'
  checkbox         :chck_shared,                                    :id => 'shared'
  checkbox         :chck_private,                                   :id => 'private'
  checkbox         :chck_open,                                      :id => 'open'
  checkbox         :chck_available,                                 :id => 'available'
  checkbox         :chck_notAvailable,                              :id => 'notAvailable'
  checkbox         :chck_noRestriction,                             :id => 'noRestriction'
  checkbox         :chck_inLibraryUse,                              :id => 'inLibraryUse'
  checkbox         :chck_supervisedUse,                             :id => 'supervisedUse'
  checkbox         :chck_monograph,                                 :id => 'monograph'
  checkbox         :chck_serials,                                   :id => 'serials'
  checkbox         :chck_others,                                    :id => 'others'

  #Search Result
  button           :btn_request,                                    :xpath =>"html/body/section/div/div/div/div/div/form/fieldset/div[2]/div/div/div[3]/div[3]/button[2]"
  button           :btn_export,                                     :id => 'export'
  div              :txt_searchResultsMsg,                           :xpath => "html/body/section/div/div/div/div/div/form/fieldset/div[2]/div/div/div[3]/div/div/span[2]"
  div              :txt_alert_alert_info,                           :class => 'alert-info'
  link             :lnk_title_of_bib,                               :id => 'searchResultsDataTitleS-2'
  div              :tbl_bib_detail_page,                            :id => 'marcRecordViewDivId'
  div              :txt_total_value,                                :xpath => "html/body/section/div/div/div/div/div/form/fieldset/div[2]/div/div/div[3]/div[1]/div[3]/span[1]/span"
  checkbox         :chck_NYPL,                                      :id => 'owningInstitutionNYPL'
  checkbox         :chck_CUL,                                       :id => 'owningInstitutionCUL'
  checkbox         :chck_PUL,                                       :id => 'owningInstitutionPUL'
  checkbox         :chck_selectAllFacets,                           :id => 'selectAllFacets'
  select_list      :chck_numOfRecordsId,                            :id => 'numOfRecordsId'
  table            :tbl_searchResultsDataPlus24,                    :id => 'searchResultsDataPlus-24'
  table            :tbl_searchResultsDataPlus49,                    :id => 'searchResultsDataPlus-49'
  table            :tbl_searchResultsDataPlus99,                    :id => 'searchResultsDataPlus-99'
  image            :image_showItemsIcon,                            :id => 'showItemsIcon-5'
  table            :tbl_searchItemResultsRow5,                      :id => 'searchItemResultsRow-5'
  span             :btn_show_facts,                                 :id => 'showFacets'

  #-------------------------------------------------------------------------------------
  text_field       :password,                             :xpath => "//input[@type='password']"
  button           :continue,                             :class => 'box-submit'
  link             :lnk_forgot,                           :class => 'small-text'
  text_field       :int_forgot_email,                     :class => 'form-control'
  div              :txt_alert_msg,                        :class => 'alert-success'


  def get_valid_barcode
    btn_search
    wait_until(30, ""){table_searchResultsDiv_element.visible?}
    barcode = span_element(:id=>"searchResultsDataBarS-0").text
    if barcode == ""
      barcode = span_element(:id=>"searchResultsDataBarS-1").text
      if barcode ==""
        barcode = span_element(:id=>"searchResultsDataBarS-2").text
        if barcode == ""
          barcode = span_element(:id=>"searchResultsDataBarS-3").text
          if barcode ==""
            image_element(:id=>'showItemsIcon-0').click
            barcode = span_element(:id=>'searchItemResultsDataBarS-0-0').text
          end
        end
      end

    end
    return barcode
  end

  def login_driver_portal
    driver_valid_credentials = TestData.driver_portal_login_details
    populate_page_with driver_valid_credentials
    continue_element.click
  end

  def login_with_invalid_credential_for_dp
    driver_invalid_credentials = TestData.dp_invalid_credentials
    populate_page_with driver_invalid_credentials
  end

  def login_management_website
    management_site_credential = TestData.management_site_credentials
    populate_page_with management_site_credential
    btn_sign_in_element.click
  end

  def switch_browser_title(txt_switch_window)
        #create a array with window_id and its corresponding window page title
        wnd_titl = @browser.window_handles.map do |w|
          @browser.switch_to.window(w)
          [w,@browser.title]
        end
        #required window
        win_id = wnd_titl.find { |e1,e2| e2 == txt_switch_window }.first
        @browser.switch_to.window(win_id) #switched to the required window
        @browser.manage.window.maximize
  end
end
