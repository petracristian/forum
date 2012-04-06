require "rubygems"
require "rspec/expectations"
require "selenium-webdriver"
require 'date'

require 'cucumber/formatter/unicode' # Remove this line if you don't want Cucumber Unicode support

# SITE = "http://qa.ms.reea.net/proiecte/workspace/typo3/"
QA_SITE = "http://qa.ms.reea.net/apps/phpBB3/"

ENV["RAILS_ENV"] ||= "cucumber"
ENV['CUCUMBER_OUTPUT_ENCODING'] = "UTF-8"
SITE = ENV['SITE'] || QA_SITE
DEBUG_FILE = "reports/Console.txt"
## SAVE URL TO FILE!!!!! ASAP!
#$aFile = File.open(DEBUG_FILE, "w")
def debugMessage(what)
#  $aFile.write(what) 
#  $aFile.write("\n")
end


#browser_type = ENV['BROWSER']  || 'firefox'
PAGES = {
	"HOMEPAGE"            =>	SITE,
}
 
MENUS = {
} 

XPATHS = {
  "FOOTER_MENU"       => "//div[@id='footer-fat']",
  "LOGIN"			  => "//p[@id='gettingStartedStepThree']/a",
  "LOGIN-FORM"        => "//div[@id='t3-login-form-fields']/input",
  "GET-INVOLVED"      => "//p[@id='gettingStartedStepFurtherReading']/a",
  "SUBMIT-FEEDBACK"   => "//fieldset[@class='csc-mailform']/div[4]/input",
  "GO-BUTTON"         => "//fieldset[@class='display-options']/label[3]/input"
}

LINKS = {
  
}

ELEMENTS = {
  "LEFT NAVIGATION" => { "format" =>:xpath, "value" =>"//ul[@id='main-items-list']/li" }
}

TIMEOUT = 30
SLEEP = 1

#profile = Selenium::WebDriver::Firefox::Profile.new(model)
#profile.add_extension("c:\tmp\firebug.xpi")

#profile.addCustomRequestHeaders("X-Auth-Login","1")

#added profile
#pr = Selenium::WebDriver::Firefox::Profile.new
#pr.native_events = true

#BROWSER = Selenium::WebDriver.for :firefox, :profile =>pr
BROWSER  = Selenium::WebDriver.for :firefox
#BROWSER = Selenium::WebDriver.for :chrome

# capabilities = Selenium::WebDriver::Remote::Capabilities.internet_explorer
# capabilities = Selenium::WebDriver::Remote::Capabilities.safari
# capabilities.javascript_enabled = true

# BROWSER = Selenium::WebDriver.for( :remote,
#   :url                  => "http://192.168.21.145:4444/wd/hub",
#   :desired_capabilities => capabilities
# )
# 
#BROWSER.addHeader("X-Auth-Login","1");
#BROWSER.addHeader("X-Auth-Key","86f7e437faa5a7fce15d1ddcb9eaeaea377667b8");

#ADDED
BROWSER.capabilities.native_events = false

BROWSER.manage.timeouts.implicit_wait = 10
BROWSER.navigate.to SITE

original_window = BROWSER.window_handle
debugMessage("===========START==========")
debugMessage("Running on "+SITE+"")
debugMessage("===========")

After do | scenario |
  BROWSER.save_screenshot("reports/errorshot-#{Time.new.to_i}.jpg") if scenario.failed?
end

# Close the browser when we are done
at_exit do
  # BROWSER.save_screenshot("sshot-#{Time.new.to_i}.jpg")
BROWSER.close()
debugMessage("===========STOP===========")
#$aFile.close
end

