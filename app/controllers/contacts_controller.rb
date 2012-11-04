#!/usr/bin/ruby
require 'gappsprovisioning/provisioningapi'
include GAppsProvisioning
class ContactsController < ApplicationController
  def index
  end

  def new
     @contact = Contact.new
  end

  def create
     @contact = Contact.new(params[:contact])
     @google_apps_connection ||= ProvisioningApi.new(GOOGLE_APPS_CONFIG['username'], GOOGLE_APPS_CONFIG['password'])
     if @contact.save
        ListMailer.mailing_list_notification_email(@contact).deliver
        flash[:information] = "Thanks for signing up! You will be hearing from us shortly"
        add_user_to_google_group(@google_apps_connection, params[:contact][:email], "mailing_list")
        redirect_to :root
     else
        flash[:error] = @contact.errors.full_messages.to_sentence
        redirect_to :root
     end
  end

  def delete
  end
  
  private
  
  def add_user_to_google_group(connection, user, group)
    connection.add_member_to_group(user, group)
  end
end
