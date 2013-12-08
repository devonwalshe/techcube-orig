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
        ListMailer.mailing_list_thankyou_email(@contact).deliver
        add_user_to_mailchimp(@contact.name, @contact.email, :all)
        if @contact.iama == "a freelancer"
          add_user_to_mailchimp(@contact.name, @contact.email, :freelancers)
        elsif @contact.iama == "a student"
          add_user_to_mailchimp(@contact.name, @contact.email, :students)
        elsif @contact.iama == "working in professional services"
          add_user_to_mailchimp(@contact.name, @contact.email, :services)
        elsif @contact.iama == "an investor"
          add_user_to_mailchimp(@contact.name, @contact.email, :investors)
        elsif @contact.iama == "working in a startup"
          add_user_to_mailchimp(@contact.name, @contact.email, :startups)
        end
        flash[:information] = "Thanks for signing up! You will be hearing from us shortly"
        # add_user_to_google_group(@google_apps_connection, params[:contact][:email], "mailing_list")
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
  
  def add_user_to_mailchimp(name, email, list)
    lists = Contact::WEBSITE_LISTS
    mc_api = Mailchimp::new("07a1a65399a7f44b7be270ee3414adc1-us6")
    params = {
      :id => lists[list],
      :email_address => email,
      :merge_vars => {
        :FNAME => name
      },
      :double_optin => false,
      :send_welcome => false
    }
    mc_api.listSubscribe(params)
  end
end
