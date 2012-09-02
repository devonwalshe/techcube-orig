
class ContactsController < ApplicationController
  def index
  end

  def new
     @contact = Contact.new
  end

  def create
     @contact = Contact.new(params[:contact])
     
     if @contact.save
        flash[:information] = "Thanks for signing up! You will be hearing from us shortly"
        redirect_to :root
     else
        flash[:error] = @contact.errors.full_messages.to_sentence
        redirect_to :root
     end
  end

  def delete
  end
end
