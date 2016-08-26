class SearchPage
  include PageObject

  #page_url ENV['URL']

  #page_url"http://dev-recap.htcinc.com:9090/search"

  page_url "http://tst-recap.htcinc.com:9090/search"

  #Search page
  text_field       :txt_search_box,                                 :id => 'fieldValue'
  div              :checkbox_ownInstId,                             :id => 'ownInstId'
  div              :checkbox_cgdId,                                 :id => 'cgdId'
  div              :checkbox_availabilityId,                        :id => 'availabilityId'
  div              :checkbox_materialTypeId,                        :id => 'materialTypeId'
  select_list      :drdown_fieldName,                               :id => 'fieldName'
  button           :btn_search,                                     :id => 'search'
  button           :btn_clear,                                      :id => 'clear'
  button           :btn_newSearch,                                  :id => 'newSearch'
  div              :table_searchResultsDiv,                         :id => 'searchResultsDiv'

  #Search Result
  button           :btn_request,                                    :id =>'request'
  button           :btn_export,                                     :id => 'export'
  div              :txt_searchResultsMsg,                           :id => 'searchResultsMsgId'
  link             :lnk_title_of_bib,                               :id => 'searchResultsDataTitle-2'
  div              :tbl_bib_detail_page,                            :id => 'marcRecordViewDivId'
  div             :txt_total_value,                                :id => 'searchResultsHeadId'
  checkbox         :chck_NYPL,                                      :id => 'owningInstitutionNYPL'
  checkbox         :chck_CUL,                                       :id => 'owningInstitutionCUL'
  checkbox         :chck_PUL,                                       :id => 'owningInstitutionPUL'
  #-------------------------------------------------------------------------------------
  text_field       :password,                             :xpath => "//input[@type='password']"
  button           :continue,                             :class => 'box-submit'
  link             :lnk_forgot,                           :class => 'small-text'
  text_field       :int_forgot_email,                     :class => 'form-control'
  div              :txt_alert_msg,                        :class => 'alert-success'

  #ManagementPortal
  text_field       :username,                            :id => 'username_id'
  text_field       :pword,                               :id => "password_id"
  button           :btn_sign_in,                         :class => 'signin-btn'

  ##def initialize_page
  #has_expected_element?
  #end

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

end
