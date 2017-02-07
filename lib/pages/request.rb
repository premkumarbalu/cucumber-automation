
class RequestPage
  include PageObject

  span           :lnk_searchrequest,                                      :xpath => "//div[1]/div[2]/div[1]/div[2]/a"
  button         :btn_search,                                             :id => 'searchRequestsButton'
  button         :btn_cancel,                                             :id => 'cancelRequestsButtonId'


end

