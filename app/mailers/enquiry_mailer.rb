class EnquiryMailer < ActionMailer::Base
  default :from => "TC-bot@techcu.be"
  
  def enquiry_notification_email(enquiry)
    @enquiry = enquiry
    mail(:to => "notifications@techcu.be", :subject => "NEW ENQUIRY - #{@enquiry.company}")
  end
  
  def enquiry_thankyou_email(enquiry)
    @enquiry = enquiry
    mail(:to => @enquiry.email, :subject => "Thank you for registering your interest in TechCube - we will get back to you shortly")
  end
end
