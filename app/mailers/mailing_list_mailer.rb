class EnquiryMailer < ActionMailer::Base
  default :from => "noreply@techcu.be"
  
  def enquiry_notification_email(signup)
    @signup = signup
    mail(:to => "admin@techcu.be", :subject => "NEW MAILING LIST SIGNUP - #{"Some data"} - #{"Some other data"}")
    
  end
end