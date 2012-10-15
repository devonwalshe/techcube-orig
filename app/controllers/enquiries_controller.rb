#!/usr/bin/ruby
require 'provisioning-api'
include GAppsProvisioning

class EnquiriesController < ApplicationController
  def create
    
    @enquiry = Enquiry.new(params[:enquiry])
    if @enquiry.save
       EnquiryMailer.enquiry_notification_email(@enquiry).deliver
       flash[:information] = "Thanks for sending us your information! Someone will be in touch shortly"
       redirect_to "/tenants"
    else
      flash[:error] = @inquiry.errors.full_messages.to_sentence
      redirect_to "/tenants"
    end
    
  end
  
  private
  
  
  
end
