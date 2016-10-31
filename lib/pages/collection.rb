
class CollectionPage
  include PageObject

  text_field       :txt_search_box,                                 :id => 'barcodeFieldId'
  button           :btn_displayrecords,                             :id => 'displayRecords'
  span             :txt_note,                                       :xpath => ".//*[@id='collectionRecordsDivId']/div[1]/div/span"
  div              :txt_collectionresults,                          :id => 'collectionResultsDiv'

  table            :txt_barcode,                                    :xpath => ".//*[@id='collectionResults']/thead/tr/th[2]"
  table            :txt_title,                                      :xpath => ".//*[@id='collectionResults']/thead/tr/th[3]"
  table            :txt_cgd,                                        :xpath => ".//*[@id='collectionResults']/thead/tr/th[4]"


  text_field       :lnk_title,                                      :xpath =>".//*[@id='displayResults-0']/td[3]/a"
  div              :txt_item_details,                               :id => 'collectionUpdateDivId'
  radio            :btn_editcgdaction,                              :id => 'editCgdAction'
  radio            :btn_deaccesionaction,                           :id => 'deaccesionAction'
  select           :sel_newcgdfield,                                :id => 'newCgdField'
  text_field       :txt_cgdchangenotesfield,                        :id => 'cgdChangeNotesField'
  text_field       :txt_deaccessiontype,                            :id => 'deaccessionType'
  select           :txt_deliverylocation,                           :id => 'deliveryLocation'
  text_field       :txt_deaccessionnotesfield,                      :id => 'deaccessionNotesField'
  button           :btn_collectionupdatebutton,                     :id => 'collectionUpdateButton'
  text_field       :CGD_status,                                      :id => 'searchResultRows0.collectionGroupDesignation'


end
