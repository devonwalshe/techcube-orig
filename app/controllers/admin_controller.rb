class AdminController < ApplicationController
  before_filter :check_admin

  def index
   @jobs = Job.all
   @events = Event.all
   @users = User.all
   @pages = Page.all
  end
  
  
  
  private
  
  def check_admin
    redirect_to(root_path) and flash[:notice] = "you have to be an admin to access that page" unless current_user.admin?
  end
end
