class EnquiryMailer < ActionMailer::Base
  default :from => "TC-bot@techcu.be"
  
  def enquiry_notification_email(enquiry)
    @enquiry = enquiry
    mail(:to => "notifications@techcu.be", :subject => "NEW ENQUIRY - #{@enquiry.company}")
    
  end
end
