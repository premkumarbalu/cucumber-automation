
class RequestPage
  include PageObject
  include DataMagic

  span           :lnk_searchrequest,                                      :xpath => "//div[1]/div[2]/div[1]/div[2]/a"
  button         :btn_search,                                             :id => 'searchRequestsButton'
  button         :btn_cancel,                                             :id => 'cancelRequestsButtonId'
  button         :create_button,                                          :id => 'createrequestsubmit'

  text_field      :txt_itembarcode,                                       :id =>'itemBarcodeId'
  text_field      :txt_patronbarcode,                                     :id => 'patronBarcodeId'
  text_field      :txt_emailid,                                           :id => 'patronEmailId'
  select          :sele_requestinginsti,                                  :id => 'requestingInstitutionId'
  text_field      :txt_notes,                                             :id => 'requestNotesId'
  select          :delivery_location,                                     :id => 'deliveryLocationId'
  button          :create_another_request,                                :id => 'anotherRequestButtonId'
  text_field       :itembarcode,                                          :id => 'itemBarcode'



  def populate_data(txt_insti)


    DataMagic.yml_directory ="#{Dir.getwd}"
    DataMagic.load('config/sitedb.yml')

    case txt_insti
      when 'PUL'
        data = data_for(:pul_patron_information)
        populate_page_with data
      when 'CUL'
        data = data_for(:cul_patron_information)
        populate_page_with data
      when 'NYPL'
        data = data_for(:nypl_patron_information)
        populate_page_with data
    end
  end

end