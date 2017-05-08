

Before do |scenario|
 # $log = Logger.new("log/loffile#{Time.now.strftime('%Y_%m_%d-%HH_%MM_%SS')}.log")
  #$log.debug("Scenario: #{scenario.name}")

   headless = Headless.new
   headless.start
   #headless.video.start_capture

   @browser = Selenium::WebDriver.for :ff
   #@browser = Watir::Browser.new :firefox
   #@browser = Selenium::WebDriver.for :chrome
   @browser.manage.window.maximize
end

After do |scenario|
 ## $log.debug("status: #{scenario.status}")
  if scenario.failed?
    #headless.video.stop_and_save("/tmp/#{BUILD_ID}/#{scenario.name.split.join("_")}.mov")
    #@browser.save_screenshot(path)
    @browser.save_screenshot("./results/#{Time.now.strftime('%Y_%m_%d-%HH_%MM_%SS')}_screenshot.png")
    embed "./results/#{Time.now.strftime('%Y_%m_%d-%HH_%MM_%SS')}_screenshot.png", "image/png" rescue false
  end
  @browser.quit
  #headless.destroy
end
