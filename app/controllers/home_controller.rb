
class HomeController < ApplicationController
  def index
    @contact = Contact.new
  end
  
  def tenants
    @contact = Contact.new
    @inquiry = Enquiry.new
  end
  
  def community
    @contact = Contact.new
  end
  
  def mission
    @contact = Contact.new
  end
  
  
end
