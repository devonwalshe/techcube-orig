class ListMailer < ActionMailer::Base
  default :from => "TC-bot@techcu.be"
  
  def mailing_list_notification_email(signup)
    @signup = signup
    mail(:to => "notifications@techcu.be", :subject => "NEW MAILING LIST SIGNUP - #{@signup.email} - #{@signup.name} - is #{@signup.iama}")  
  end
  
  def mailing_list_thankyou_email(signup)
    @signup = signup
    mail(:to => @signup.email, :subject => "Thank you for signing up to TechCube's mailing list")
  end
end
