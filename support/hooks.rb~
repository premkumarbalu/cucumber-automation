

Before do |scenario|
  $log = Logger.new("log/loffile#{Time.now.strftime('%Y_%m_%d-%HH_%MM_%SS')}.log")
  $log.debug("Scenario: #{scenario.name}")
  @browser = Selenium::WebDriver.for :ff
  @browser.manage.window.maximize
end

After do |scenario|
 ## $log.debug("status: #{scenario.status}")
  if scenario.failed?
    path = "log/#{Time.now.strftime('%Y_%m_%d-%HH_%MM_%SS')}.jpg"
    ##@browser.save_screenshot(path)
  end
  @browser.quit
end
