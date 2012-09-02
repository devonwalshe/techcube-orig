
class HomeController < ApplicationController
  def index
    @contact = Contact.new
  end
  
  def tenants
    @contact = Contact.new
    @inquiry = Enquiry.new
  end
  
  def public
    @contact = Contact.new
  end
  
  
  
end
