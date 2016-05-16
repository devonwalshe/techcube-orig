# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Tc::Application.initialize!

# Configuration for using SendGrid on Heroku

# ActionMailer::Base.delivery_method = :smtp

# ActionMailer::Base.smtp_settings = {
#   :user_name => "yourSendGridusernameyougetfromheroku",
#   :password => "yourSendGridpasswordyougetfromheroku",
#   :domain => "staging.freelanceful.com",
#   :address => "smtp.sendgrid.net",
#   :port => 587,
#   :authentication => :plain,
#   :enable_starttls_auto => true
# }