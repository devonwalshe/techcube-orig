class ApplicationController < ActionController::Base
  
  protect_from_forgery
  # before_filter :check_uri
  include SessionsHelper
  include ApplicationHelper
  
  def page_not_found
    render "home/page_not_found", :status=>404
  end
  
  def live_jobs
      Job.where("today >= live_date AND today <= expiry_date")
  end
  
  
  private
    
    def authenticate
       deny_access unless current_user.admin?
    end
    
    def check_uri
      redirect_to request.protocol + "www." + request.host_with_port + request.request_uri if !/^www/.match(request.host)
    end

end
