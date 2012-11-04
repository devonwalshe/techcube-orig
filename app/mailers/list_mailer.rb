class ListMailer < ActionMailer::Base
  default :from => "TC-bot@techcu.be"
  
  def mailing_list_notification_email(signup)
    @signup = signup
    mail(:to => "test_list@techcu.be", :subject => "NEW MAILING LIST SIGNUP - #{@signup.email} - #{@signup.name} - is #{@signup.iama}")
    
  end
end
