# Step for navigation to a page
Given /^that I am on page "([^\"]*)"$/ do |page|
  BROWSER.navigate.to(PAGES[page])
end

# Click on link based on id value
When /^I click on link id "([^\"]*)"$/ do |linklink|  
  link_with_attribute("id", link).click
end

When /^I click on link href "([^\"]*)"$/ do |link|
  link_with_attribute("href", link).click
end

When /^I click on link class "([^\"]*)"$/ do |link|
  link_with_attribute("class", link).click
end

#Press button
When /^I click on "([^\"]*)" button$/ do |button|  
  link_with_attribute("id", XPATHS[button]).click
end




Then /^I should see form "([^\"]*)"$/ do |form_id|
  BROWSER.find_element(:id, form_id).displayed?.should == true
end

When /^I click on link "([^\"]*)"$/ do |link|
  link_with_text(link).click
end


When /^I click on input "([^\"]*)"$/ do |input|  
  BROWSER.find_element(:id, input).click
end

# Setting the radio button to a value
When /^I select the "([^\"]*)" radio button$/ do |button_id|
  BROWSER.find_element(:id, button_id).select
end

# Checking a piece of text can be found on the page
Then /^I should see text "([^\"]*)"$/ do |text|
  wait_until_true { BROWSER.page_source.include?(text) }
	begin 
  	BROWSER.page_source.include?(text).should == true
	rescue Selenium::WebDriver::Error::ObsoleteElementError
	end
end

# Entering text in an input field
Then /^I enter text "([^"]*)" to the "([^"]*)" field$/ do |text, input|
  BROWSER.find_element(:id, input).clear
  sleep 2
  BROWSER.find_element(:id, input).send_keys(text)
end


When /^I wait ([^\"]*) seconds$/ do |sleep_time|
  sleep(sleep_time.to_i)
end

# Comparing the page title
Then /^the page title should contain "([^\"]*)"$/ do |title|
  wait_until_true { BROWSER.title.include?(title) }
	begin
  	BROWSER.title.include?(title).should == true
	rescue Selenium::WebDriver::Error::ObsoleteElementError
	end
end


Then /^I press "([^\"]*)" key/ do |key|
	BROWSER.find_element(:id,"content-wrapper").send_keys(key)
end


Then /^div "([^"]*)" should be visible/ do |div|
  BROWSER.find_elements(:xpath, XPATHS[div]).size.should >= 1
end

# Click on link based on xpath value
When /^I click on "([^"]*)" link$/ do |link|
  BROWSER.find_element(:xpath, XPATHS[link]).click
end

Then /^I save url to variable "([^"]*)"$/ do |arg1|
  PAGES[arg1] = BROWSER.current_url
end

Then /^I should see (\d+) required fields$/ do |arg1|
  BROWSER.find_elements(:xpath,XPATHS['required']).size.should == arg1.to_i
  #should be ARBG1 required elements in form
end

When /^I select option "([^\"]*)" from select "([^\"]*)"$/ do |select_value, select_input|
  selector = BROWSER.find_element(:name, select_input)
  options=selector.find_elements(:tag_name,'option')
  option=options.find { |opt| opt.attribute(:value) =~ /#{select_value}/ }
  sleep 2
  option.click
end

# Entering text in an input field
When /^I enter text "([^\"]*)" to the field name "([^\"]*)"$/ do |text, input|
  BROWSER.find_element(:name, input).clear
  sleep 2
  BROWSER.find_element(:name, input).send_keys(text)
end

When /^I choose option "([^"]*)" from select "([^"]*)"$/ do |select_value, select_name|
  selector = BROWSER.find_element(:xpath, XPATHS[select_input])
  options=selector.find_elements(:tag_name,'option')
  option=options.find { |opt| opt.attribute(:value) =~ /#{select_value}/ }
  option.click
  
end

Then /^I should see "([^"]*)" items in "([^"]*)"$/ do |amount, item|
	BROWSER.find_elements(ELEMENTS[item]["format"], ELEMENTS[item]["value"]).size.should == amount.to_i
end


############################  Homepage features  #####################################
When /^I click the Login button$/ do
  BROWSER.find_element(:xpath, XPATHS["LOGIN"]).click
end

Then /^I should see login form$/ do
   BROWSER.find_element(:name, 'loginform').displayed?.should == true
end

When /^I click the login form button$/ do
  BROWSER.find_element(:xpath, XPATHS["LOGIN-FORM"]).click
end

When /^I click link Get involved$/ do
   BROWSER.find_element(:xpath, XPATHS["GET-INVOLVED"]).click
end

When /^I click on Submit Feedback$/ do
   BROWSER.find_element(:xpath, XPATHS["SUBMIT-FEEDBACK"]).click
end


######################### login_cust.feature #########################3
When /^I click the Login  button$/ do
  BROWSER.find_element(:name, "login").click
end

When /^I click the button name "([^\"]*)"$/ do |item|
	BROWSER.find_element(:name, item).click
end
	

When /^I click the Logout button$/ do
	BROWSER.find_element(:name, "submit").click
end

######################### search.feature ######################
Then /^I should see search form$/ do
	BROWSER.find_element(:id, 'searchBox').displayed?.should == true
end

Then /^I click enter on search form$/ do
	BROWSER.find_element(:id, 'st').send_keys(:return)
end

And /^I click on button Go$/ do
	 BROWSER.find_element(:xpath, XPATHS["GO-BUTTON"]).click
end