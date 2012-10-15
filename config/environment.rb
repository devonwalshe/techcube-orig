# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Tc::Application.initialize!

# Mailer configuration

ActionMailer::Base.smtp_settings = {
  
  :address => "smtp.google.com",
  :port => 587,
  :user_name => "devon@techcu.be",
  :password => "alphabrodie12",
  :authentication => "login"
}

