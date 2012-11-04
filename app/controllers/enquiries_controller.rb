#!/usr/bin/ruby
require 'gappsprovisioning/provisioningapi'
include GAppsProvisioning
class EnquiriesController < ApplicationController
  def create
    @google_apps_connection ||= ProvisioningApi.new(GOOGLE_APPS_CONFIG['username'], GOOGLE_APPS_CONFIG['password'])
    @enquiry = Enquiry.new(params[:enquiry])
    if @enquiry.save
       EnquiryMailer.enquiry_notification_email(@enquiry).deliver
       flash[:information] = "Thanks for sending us your information! Someone will be in touch shortly"
       # add_user_to_google_group(@google_apps_connection, params[:enquiry][:email], "enquiries")
       redirect_to "/tenants"
    else
      flash[:error] = @inquiry.errors.full_messages.to_sentence
      redirect_to "/tenants"
    end
    
  end
  
  private
  
  def add_user_to_google_group(connection, user, group)
    connection.add_member_to_group(user, group)
  end
  
end
