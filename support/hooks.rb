

Before do |scenario|
  $log = Logger.new("log/loffile#{Time.now.strftime('%Y_%m_%d-%HH_%MM_%SS')}.log")
  $log.debug("Scenario: #{scenario.name}")

  headless = Headless.new
  headless.start
  #headless.video.start_capture

  @browser = Selenium::WebDriver.for :ff
   @browser.manage.window.maximize
end

After do |scenario|
 ## $log.debug("status: #{scenario.status}")
  if scenario.failed?
    path = "log/#{Time.now.strftime('%Y_%m_%d-%HH_%MM_%SS')}.jpg"
    #headless.video.stop_and_save("/tmp/#{BUILD_ID}/#{scenario.name.split.join("_")}.mov")
    ##@browser.save_screenshot(path)
  end
  @browser.quit
  headless.destroy
end
