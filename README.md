# Rate My Agent Checker

## Overview

The Rate My Agent Checker is a Ruby script designed to periodically check the availability of the Rate-My-Agent.com website and report any downtime. It can be used to ensure the website is always up and running. The script utilizes the Selenium web automation framework to perform the checks.

## Prerequisites

Before running the script, make sure you have the following prerequisites installed:

- Ruby: You need to have Ruby installed on your system. You can download it from [https://www.ruby-lang.org/](https://www.ruby-lang.org/).

- Selenium WebDriver: Install the Selenium WebDriver for Ruby using the following command:

  ```bash
  gem install selenium-webdriver

Chrome Browser: The script uses Chrome for web automation, so ensure you have Google Chrome installed.



## Setup
Clone the Repository:
```bash
git clone https://github.com/yourusername/rate-my-agent-checker.git
cd rate-my-agent-checker


## Local Testing
You can test the script locally to ensure it's working correctly without sending actual emails.
1. In the terminal, navigate to the directory where rate_my_agent_checker.rb is located:
cd /path/to/rate-my-agent-checker

2.Run the script:
ruby rate_my_agent_checker.rb
The script will run and periodically check the website. When it detects an issue, it will log the error message to the console.

## Cron Job
To schedule the script to run periodically (e.g., every 3 minutes), you can create a cron job. Open your crontab file for editing with the following command:

crontab -e
Add a line to schedule the script:

*/3 * * * * /usr/bin/ruby /path/to/rate_my_agent_checker.rb
Replace /usr/bin/ruby with the path to your Ruby interpreter and /path/to/rate_my_agent_checker.rb with the actual path to your script file.

Save the crontab and exit the editor to set up the cron job.

## Customizing Email (Optional)
If you want to enable email notifications, you need to configure the send_email function in the script with your SMTP server settings. This function is currently set to print messages to the console for local testing.
