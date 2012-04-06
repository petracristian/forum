# Ruby methods used in the steps
# 
# Get a single element using wait
def get_element(how, what)
  wait_until_loaded { BROWSER.find_element(how, what) }
end

# Get a multiple elements using wait
def get_elements(how, what)
  wait_until_loaded { BROWSER.find_elements(how, what) }
end

def wait_until_loaded(timeout = TIMEOUT, &blk)
  end_time = Time.now + timeout

  until Time.now >= end_time
    begin
      elem = yield
    rescue Selenium::WebDriver::Error::NoSuchElementError, Selenium::WebDriver::Error::ObsoleteElementError
    else
      return elem
    end
    sleep SLEEP
  end

  raise "Element not found after " + timeout.to_s + " seconds"
end

def wait_until_true(timeout = TIMEOUT, &blk)
  end_time = Time.now + timeout

  until Time.now >= end_time
    begin
      result = yield
    rescue Selenium::WebDriver::Error::NoSuchElementError, Selenium::WebDriver::Error::ObsoleteElementError
    else
      if result == true
        return
      end
    end
    sleep SLEEP
  end

  raise "No match found after " + timeout.to_s + " seconds"
end

# Clicking on a link with a specific attribute
def link_with_attribute(attribute, value)
  wait_until_loaded { BROWSER.find_element(:xpath, "//a[@" + attribute + "='#{value}']") }
end

# Clicking on a link with a specific attribute
def link_with_text(value)
  wait_until_loaded { BROWSER.find_element(:link_text, value) }
end

# Clicking on an image with a specific attribute
def image_with_attribute(attribute, value)
  wait_until_loaded { BROWSER.find_element(:xpath, "//img[@" + attribute + "='#{value}']") }
end