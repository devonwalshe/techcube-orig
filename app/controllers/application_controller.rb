class ApplicationController < ActionController::Base
  
  protect_from_forgery
  # before_filter :check_uri
  before_filter :get_contact
  include SessionsHelper
  include ApplicationHelper
  
  def page_not_found
    render "home/page_not_found", :status=>404
  end
  
  def live_jobs
      Job.where("current_date >= live_date AND current_date <= expiry_date")
  end
  
  def get_contact
    @contact = Contact.new
  end
  
  private
    
    def authenticate
       deny_access unless current_user.admin?
    end
    
    def check_uri
      redirect_to request.protocol + "www." + request.host_with_port + request.request_uri if !/^www/.match(request.host)
    end

end
