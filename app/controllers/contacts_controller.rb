
class ContactsController < ApplicationController
  def index
  end

  def new
     @contact = Contact.new
  end

  def create
     @contact = Contact.new(params[:contact])
     
     if @contact.save
        redirect_to :root, :notice => "Nice one"
     end
  end

  def delete
  end
end
