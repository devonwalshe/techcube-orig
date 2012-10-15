class EnquiryMailer < ActionMailer::Base
  default :from => "noreply@techcu.be"
  
  def enquiry_notification_email(enquiry)
    @enquiry = enquiry
    mail(:to => "test_list@techcu.be", :subject => "NEW ENQUIRY - #{"Some data"} - #{"Some other data"}")
    
  end
end
