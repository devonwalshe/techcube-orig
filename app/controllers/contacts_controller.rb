
class ContactsController < ApplicationController
  def index
  end

  def new
     @contact = Contact.new
  end

  def create
     @contact = Contact.new(params[:contact])
     
     if @contact.save
        flash[:information] = "Nice one"
        redirect_to :root
     end
  end

  def delete
  end
end
