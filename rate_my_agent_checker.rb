# Import necessary libraries
require 'selenium-webdriver'
require 'net/smtp'
require 'logger'

# Set the URL to check
url = 'https://www.rate-my-agent.com'

# Configure the Selenium WebDriver
options = Selenium::WebDriver::Chrome::Options.new
options.add_argument('--headless') # Run in headless mode
driver = Selenium::WebDriver.for :chrome, options: options

# Set up logging
log_file = 'check_log.txt'
logger = Logger.new(log_file)

# Function to check if the website is up and running
def check_website(driver, url)
  begin
    driver.get(url)
    # Example: Check if the title contains "Rate My Agent"
    if driver.title.include?('Rate My Agent')
      return true
    else
      return false
    end
  rescue StandardError => e
    # Handle exceptions, e.g., 404 errors, or other issues
    return false
  end
end

# Function to send an email notification using locally
def send_email(subject, body)
    puts "Email would be sent with subject: #{subject}"
    puts "Email body:"
    puts body
end

# Function to send an email notification using smtp
# def send_email(subject, body)
#   smtp_server = 'smtp.your-email-provider.com'
#   smtp_port = 587
#   smtp_domain = 'your-domain.com'
#   smtp_username = 'your-username'
#   smtp_password = 'your-password'

#   message = <<MESSAGE_END
# From: Rate My Agent Checker <your-email@your-domain.com>
# To: alerts@rate-my-agent.com
# Subject: #{subject}

# #{body}
# MESSAGE_END

#   Net::SMTP.start(smtp_server, smtp_port, smtp_domain, smtp_username, smtp_password, :login) do |smtp|
#     smtp.send_message message, 'your-email@your-domain.com', 'alerts@rate-my-agent.com'
#   end
# end
  
# Function to run the website check
def run_website_check(driver, url, logger)
  if check_website(driver, url)
    logger.info("Website is up and running at #{Time.now}")
  else
    logger.error("Website is down or there's an issue at #{Time.now}")
    send_email('Rate My Agent Website Issue', "The website is down or there's an issue. Please check.")
  end
end

# Periodically check the website
while true
  run_website_check(driver, url, logger)
  sleep(180) # Wait for 3 minutes
end

# Close the WebDriver
driver.quit
